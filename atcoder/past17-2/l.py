INF=10000000000000
n=int(input())
cost = [[INF]*(n*2+2) for _ in range(n*2+2)]
for i in range(n*2+2):
    cost[i][i]=0

# a
for i in range(1,n):
    a=map(int,input().split())
    for j,ai in enumerate(a,i+1):
        cost[i][j] = ai
        cost[j][i] = ai
        cost[i+n][j+n] = ai
        cost[j+n][i+n] = ai

# b
for i in range(1,n):
    b=map(int,input().split())
    for j,bi in enumerate(b,i+1):
        cost[i][j+n] = bi
        cost[j][i+n] = bi

for k in range(1,n*2+2):
    for i in range(1,n*2+2):
        if i>n and k<=n: continue
        for j in range(1,n+2+2):
            if k>n and j<=n: continue
            cost[i][j] = min(cost[i][j], cost[i][k] + cost[k][j])

#print(cost)

for i in range(1,n):
    print(*cost[i][n+i+1:2*n+1])

