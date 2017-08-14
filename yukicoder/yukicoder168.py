import heapq,math

def hypot2(x,y):
  return x*x+y*y

def solve(n,l):
  dst=[[(hypot2(x1-x2,y1-y2),j)for j,(x2,y2) in enumerate(l)] for x1,y1 in l]
  visited = set()
  pq = [(0,0)]
  mx=10
  while len(pq):
    my,d = heapq.heappop(pq)
    if(mx<my):mx=my
    if(d==n-1):break
    if(d in visited):continue
    visited.add(d)
    for s,i in dst[d]:
      if(i in visited):continue
      heapq.heappush(pq,(s,i))
  ans=int(math.sqrt(mx))//10*10
  return(ans+10 if ans*ans<mx else ans)

n=int(input())
l=[list(map(int,input().split())) for _ in range(n)]
print(solve(n,l))
