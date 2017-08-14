import heapq

n=int(input())
g=[[] for _ in range(n+1)]
dp=[[[-1,-1],[-1,-1]] for _ in range(n+1)]
nv=[[] for _ in range(n+1)]
for i in range(1,n):
  a,b,t=map(int,input().split())
  if t==1:
    g[a].append((a,b,1))
    g[b].append((b,a,2))
  else:
    g[a].append((a,b,3))
    g[b].append((b,a,3))

def rec(v,p):
  nv[v]=[0,0]
  dp[v][0][0]=dp[v][1][0]=0
  for f,t,e in g[v]:
    if t==p: continue
    rec(t,v)
    for k in [0,1]:
      if e&(k+1)==0: continue
      dpk=dp[v][k]
      for j in dp[t][k]:
        if j<0 or nv[v][k]==t: continue
        if dpk[0]<j+1:
          dpk[0],dpk[1]=j+1,dpk[0]
          nv[v][k]=t
        elif dpk[1]<j+1:
          dpk[1]=j+1

rec(1, -1)
print(max(sum([[a+d-1,b+c-1] if e==f else [a+d-1,b+c-1,a+c-1] for ((a,b),(c,d)),(e,f) in zip(dp[1:],nv[1:])],[])))