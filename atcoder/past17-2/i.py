from collections import defaultdict

n=int(input())
maxl=5
s=[input().rstrip() for _ in range(n)]
h=[defaultdict(lambda: set()) for _ in range(maxl+1)]
for idx,si in enumerate(s):
    h[len(si)][si] |= {idx}

hh=[defaultdict(lambda: set()) for _ in range(maxl+1)]
ans=0
for l in range(maxl,0,-1):
    for k,v in h[l].items():
        ans+=len(v)**2
        ans+=len(v)*len(hh[l][k])
        for idx in range(l):
            t=k[:idx]+k[idx+1:]
            hh[l-1][t]|=v
    for k,v in hh[l].items():
        for idx in range(l):
            t=k[:idx]+k[idx+1:]
            hh[l-1][t]|=v

print(ans)