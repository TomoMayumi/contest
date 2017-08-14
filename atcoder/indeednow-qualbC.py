import heapq
n=int(input())
adj=[[] for _ in range(n)]
for _ in range(n-1):
    a,b=map(int,input().split())
    adj[a-1].append(b-1)
    adj[b-1].append(a-1)

gone=[False]*n
q=[0]
gone[0]=True
ans=[]
while len(q):
    d=heapq.heappop(q)
    ans.append(d+1)
    for i in adj[d]:
        if not gone[i]:
            gone[i]=True
            heapq.heappush(q,i)
print(" ".join(map(str,ans)))