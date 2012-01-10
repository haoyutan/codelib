#include <memory.h>
#include <iostream>
#include <string>
#include <vector>
#include <set>

using namespace std;

vector<string> vs;
vector<int> vq;
string *result;
set<int> sq;

struct trie_node {
	trie_node **p;
};

trie_node *root;
int nsub;

inline void
trie_p_init(trie_node *node)
{
	node->p = (trie_node **)malloc(sizeof(trie_node *) * 26);
	memset(node->p, 0, sizeof(trie_node *) * 26);
}

inline void
trie_p_idx_init(trie_node *node, int idx)
{
	node->p[idx] = (trie_node *)malloc(sizeof(trie_node));
	node->p[idx]->p = 0;
}

void
trie_init(void)
{
	root = (trie_node *)malloc(sizeof(trie_node));
	root->p = 0;
}

void
trie_insert(const char *s, int len)
{
	for (int i = 0; i < len; i++) {
		trie_node* cur = root;
		for (int j = i; j < len; j++) {
			if (cur->p == 0)
				trie_p_init(cur);
			int idx = s[j] - 'a';
			if (cur->p[idx] == 0)
				trie_p_idx_init(cur, idx);
			cur = cur->p[idx];
		} 
	}
}

void
trie_dump(const trie_node *node, int nspace)
{
	if (node->p == 0) return;
	for (int i = 0; i < 26; ++i) {
		if (node->p[i] != 0) {
			for (int j = 0; j < nspace; j++)
				cout << ' ';
			cout << (char)('a' + i) << endl;
			trie_dump(node->p[i], nspace + 1);
		}
	}
}

void
trie_destroy(trie_node *node)
{
	if (node->p != 0)
		for (int i = 0; i < 26; ++i)
			if (node->p[i] != 0) trie_destroy(node->p[i]);
	free(node);
}

void
check_query(int count, string& path)
{
	if (*sq.begin() != count)
		return;
	for (size_t i = 0; i < vq.size(); ++i)
		if (vq[i] == count)
			result[i] = path;
	sq.erase(sq.begin());
}

void
preorder_traverse(trie_node *node, string& path)
{
	static int count = -1;

	++count;
	check_query(count, path);
	if (node->p == 0) return;

	for (int i = 0; i < 26; i++)
		if (node->p[i] != 0) {
			path += (char)('a' + i);
			preorder_traverse(node->p[i], path);
			path.resize(path.size() - 1);
		}
}

int
main(int argc, char *argv[])
{
	int nstr = 0;
	cin >> nstr;
	while (nstr-- > 0) {
		string s;
		cin >> s;
		vs.push_back(s);
	}

	int nquery = 0;
	cin >> nquery;
	while (nquery-- > 0) {
		int q;
		cin >> q;
		vq.push_back(q);
		sq.insert(q);
	}
	result = new string[vq.size()];

	trie_init();

	for (vector<string>::iterator it = vs.begin(); it != vs.end(); ++it)
		trie_insert(it->c_str(), it->size());

	//trie_dump(root, 0);
	string path;
	preorder_traverse(root, path);

	for (size_t i = 0; i < vq.size(); i++)
		if (result[i].size() > 0)
			cout << result[i] << endl;
		else
			cout << "INVALID" << endl;

	return 0;
}

