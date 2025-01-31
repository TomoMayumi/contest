#include <iostream>
#include <string>
using namespace std;
#include "atcoder/lazysegtree.hpp"
#define rep(i, n) for (int i = 0; i < (n); i++)
struct Data {
  int mx[2], l[2], r[2], len;
  Data() {
    rep(t, 2) mx[t] = l[t] = r[t] = 0;
    len = 0;
  }
  Data(char c) {
    rep(t, 2) mx[t] = l[t] = r[t] = (c == '0' + t);
    len = 1;
  }
  Data flip() const {
    Data res = *this;
    swap(res.mx[0], res.mx[1]);
    swap(res.l[0], res.l[1]);
    swap(res.r[0], res.r[1]);
    return res;
  }
  static Data merge(const Data& l, const Data& r) {
    Data res;
    rep(t, 2) {
      res.l[t] = l.l[t] + (l.l[t] == l.len ? r.l[t] : 0);
      res.r[t] = r.r[t] + (r.r[t] == r.len ? l.r[t] : 0);
      res.mx[t] = max({l.mx[t], r.mx[t], l.r[t] + r.l[t]});
    }
    res.len = l.len + r.len;
    return res;
  }
};
Data f(Data a, Data b) { return Data::merge(a, b); }
Data g(int a, Data b) { return a ? b.flip() : b; }
int h(int a, int b) { return a ^ b; }
Data ti() { return Data(); }
int ei() { return 0; }
int main() {
  cin.tie(nullptr);
  ios::sync_with_stdio(false);
  int N, Q;
  string S;
  cin >> N >> Q >> S;
  vector<Data> init(N);
  rep(i, N) init[i] = Data(S[i]);
  atcoder::lazy_segtree<Data, f, ti, int, g, h, ei> seg(init);
  while (Q--) {
    int c, l, r;
    cin >> c >> l >> r;
    --l;
    if (c == 1) {
      seg.apply(l, r, 1);
    } else {
      auto ans = seg.prod(l, r);
      cout << ans.mx[1] << endl;
    }
  }
}