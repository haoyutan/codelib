#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <memory.h>

#define NK 26
#define IDX(c) (c - 'a')

struct st_node {
	const char *str;
	int len;
	struct st_node **next;
	int rank;
};

struct st_node *root;

struct st_node *
st_new_node(const char *str, int len, struct st_node **next)
{
	struct st_node *node = (struct st_node *)malloc(sizeof(struct st_node));
	node->str = str;
	node->len = len;
	node->next = next;
	return node;
}

void
st_init_next(struct st_node *node)
{
	node->next = (struct st_node **)malloc(sizeof(struct st_node *) * NK);
	memset(node->next, 0, sizeof(struct st_node *) * NK);
}

void
st_insert(struct st_node *node, const char *s, int len)
{
	if (node->next == 0) {
		st_init_next(node);
		node->next[IDX(*s)] = st_new_node(s, len, 0);
		return;
	}

	if (node->next[IDX(*s)] == 0) {
		node->next[IDX(*s)] = st_new_node(s, len, 0);
		return;
	}

	struct st_node *curnode = node->next[IDX(*s)];
	const char *s1 = curnode->str;
	int l1 = curnode->len;
	const char *s2 = s;
	int l2 = len;

	while (l1 && l2 && *s1 == *s2)
		++s1, ++s2, --l1, --l2;
	if (l1 == 0 && l2 == 0) {
		return;
	} else if (l1 == 0) {
		st_insert(curnode, s2, l2);
	} else if (l2 == 0) {
		curnode->str = s1;
		curnode->len = l1;
		struct st_node *newnode = st_new_node(s, len, 0);
		st_init_next(newnode);
		node->next[IDX(*s)] = newnode;
		newnode->next[IDX(*s1)] = curnode;
	} else {
		curnode->str = s1;
		curnode->len = l1;
		struct st_node *newnode = st_new_node(s, len - l2, 0);
		st_init_next(newnode);
		node->next[IDX(*s)] = newnode;
		newnode->next[IDX(*s1)] = curnode;
		newnode->next[IDX(*s2)] = st_new_node(s2, l2, 0);
	}
}

int
st_update_rank(struct st_node *node, int rank)
{
	rank += node->len;
	node->rank = rank;
	if (node->next == 0)
		return rank;
	for (int i = 0; i < NK; ++i)
		if (node->next[i] != 0)
			rank = st_update_rank(node->next[i], rank);
	return rank;
}

void
st_query(struct st_node *node, int k, char *result)
{
	struct st_node *current = node;

	char *buf = result;
	while (k > current->rank - current->len) {
		++count;
		if (k <= current->rank) { /* found */
			for (int l = 0; l < k + current->len - current->rank; ++l)
				*buf++ = current->str[l];
			*buf = '\0';
			return;
		}

		if (current->next == 0) { /* not found */
			*result = '\0';
			return;
		}

		/* try next level */
		struct st_node *next = 0;
		int i;
		for (i = 0; i < NK; ++i) {
			next = current->next[i];
			if (next != 0)
				break;
		}

		if (next == 0) { /* not found */
			*result = '\0';
			return;
		}

		for (; i < NK; ++i) {
			struct st_node *tmp = current->next[i];
			if (tmp != 0 && k > tmp->rank - tmp->len)
				next = tmp;
		}

		for (int l = 0; l < current->len; l++)
			*buf++ = current->str[l];
		current = next;
	}
}

void
st_dump(struct st_node *node, int nspace)
{
	printf("%*s[%d]%.*s\n", nspace, "", node->rank, node->len, node->str);
	if (node->next == 0)
		return;
	for (int i = 0; i < NK; i++)
		if (node->next[i] != 0)
			st_dump(node->next[i], nspace + 1);
}

char vstr[50][2048];
int vlen[50];
int nstr;

int vquery[500];
int nquery;

int maxrank;

void
get_input(void)
{
	scanf("%d", &nstr);
	for (int i = 0; i < nstr; ++i) {
		scanf("%s%n", vstr[i], &vlen[i]);
		--vlen[i];
	}

	scanf("%d", &nquery);
	for (int i = 0; i < nquery; ++i)
		scanf("%d", &vquery[i]);
}

void
dump(void)
{
	printf("[INPUT]\n");
	printf("%d\n", nstr);
	for (int i = 0; i < nstr; ++i)
		printf("%s,%d\n", vstr[i], vlen[i]);
	printf("%d\n", nquery);
	for (int i = 0; i < nquery; ++i)
		printf("%d\n", vquery[i]);

	printf("[OUTPUT]\n");
	st_dump(root, 0);
}

void
build_suffix_tree(void)
{
	root = st_new_node("", 0, 0);
	for (int i = 0; i < nstr; ++i)
		for (int j = 0; j < vlen[i]; ++j)
			st_insert(root, vstr[i] + j, vlen[i] - j);
	maxrank = st_update_rank(root, 0);
}

void
do_query(void)
{
	char buf[2048];
	for (int i = 0; i < nquery; ++i)
		if (vquery[i] > maxrank)
			printf("INVALID\n");
		else {
			st_query(root, vquery[i], buf);
			printf("%s\n", buf);
		}
}

int
main(int argc, char *argv[])
{
	get_input();
	build_suffix_tree();
	do_query();
	//dump();
	return 0;
}
