#include <iostream>
#include <string>
#include <vector>
#include <set>
#include <string.h>

using namespace std;

string vstr[50];
int nstr;
int vquery[500];
int nquery;

struct suffix {
	short sid;
	short idx;
	const char *cstr;
	short length;
};

suffix sufbuf[50 * 2000];

inline bool
suffix_comp(const suffix * const &ls, const suffix * const &rs)
{
	return strcmp(ls->cstr, rs->cstr) < 0;
}

typedef set<suffix *, bool(*)(const suffix * const &, const suffix * const &)> suffix_set;
suffix_set ss(suffix_comp);

struct rankinfo {
	const suffix *suf;
	short lcslen;
	short nnew;
	int rank;
};

rankinfo *vrank;

void
build_suffix_array(void)
{
	suffix *tmp = sufbuf;
	for (int i = 0; i < nstr; ++i)
		for (size_t j = 0; j < vstr[i].size(); j++) {
			tmp->sid = i;
			tmp->idx = j;
			tmp->cstr = vstr[i].c_str() + j;
			tmp->length = vstr[i].size() - j;
			ss.insert(tmp);
			++tmp;
		}

	const char *prev_str = "";
	int rank = 0;

	vrank = (rankinfo *)malloc(sizeof(rankinfo) * ss.size());
	rankinfo *pri = vrank;
	for (suffix_set::iterator it = ss.begin(); it != ss.end(); ++it) {
		suffix *cur = (*it);
		const char *str = cur->cstr;
		while (*str == *prev_str && *str)
			++str, ++prev_str;
		if (*str == *prev_str)
			continue;
		pri->suf = cur;
		pri->lcslen = str - cur->cstr;
		pri->nnew = cur->length - pri->lcslen;
		pri->rank = rank + pri->nnew;

		prev_str = cur->cstr;
		rank = pri->rank;
		++pri;
	}
}

int
binary_search(int q)
{
	int begin = 0, end = ss.size();
	while (1) {
		int mid = (begin + end) / 2;
		if (mid == begin && mid == end)
			return mid;
		if (vrank[mid].rank >= q && vrank[mid - 1].rank < q)
			return mid;
		if (vrank[mid].rank < q)
			begin = mid + 1;
		else
			end = mid;
	}
}

void
do_query(void)
{
	for (size_t i = 0; i < nquery; ++i) {
		int pos = binary_search(vquery[i]);
		if (pos == ss.size())
			cout << "INVALID" << endl;
		else {
			rankinfo &ri = vrank[pos];
			int len = ri.lcslen + vquery[i] - (ri.rank - ri.nnew);
			cout << vstr[ri.suf->sid].substr(ri.suf->idx, len) << endl;
		}
	}
}

void
get_input(void)
{
	cin >> nstr;
	for (int i = 0; i < nstr; ++i)
		cin >> vstr[i];
	cin >> nquery;
	for (int i = 0; i < nquery; ++i)
		cin >> vquery[i];
}

void
dump_info(void)
{
	int i = 0;
	for (suffix_set::iterator it = ss.begin(); it != ss.end(); ++it) {
		cout << (*it)->cstr << ": "
		     << vrank[i].lcslen << ", "
		     << vrank[i].nnew << ", "
                     << vrank[i].rank << endl;
		++i;
	}
}

void
dump_input(void)
{
	for (int i = 0; i < nstr; i++)
		cout << vstr[i] << endl;
	for (size_t i = 0; i < nquery; i++)
		cout << vquery[i] << endl;
}

int
main(int argc, char *argv[])
{
	get_input();
	build_suffix_array();
	do_query();
	//dump_info();
	return 0;
}

