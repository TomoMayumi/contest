from collections import defaultdict
import itertools

INF=100000000000000
n,m=map(int,input().split())
classes=[list(map(int,input().split())) for _ in range(n)]
#dp[単位]=必要な労力
dp=defaultdict(lambda: INF)
dp[0]=0
for _,l in itertools.groupby(classes,lambda x: x[1]):
    l = list(l)
    for k in list(dp.keys()):
        for a,b,c in l:
            nk = min(k+c,m)
            dp[nk] = min(dp[nk],dp[k]+a)

if dp[m]==INF:
    print(-1)
else:
    print(dp[m])