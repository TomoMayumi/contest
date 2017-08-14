import heapq

r,c=map(int,input().split())
m=[input() for _ in range(r)]
sr=["s" in i for i in m].index(True)
sc=m[sr].index("s")
tr=["t" in i for i in m].index(True)
tc=m[tr].index("t")

pq=[(0,sr,sc)]
visited=set()
while True:
  un,ur,uc=heapq.heappop(pq)
  if (ur,uc) in visited: continue
  visited.add((ur,uc))
  for nr,nc in [(ur,uc+1),(ur,uc-1),(ur+1,uc),(ur-1,uc),(ur+1,uc+1 if ur%2 else uc-1),(ur-1,uc+1 if ur%2 else uc-1)]:
    if nr<0 or nr>=r or nc<0 or nc>=c or (nr,nc) in visited: continue
    if tr==nr and tc==nc:
      print(un)
      exit()
    nn=un+int(m[nr][nc])
    heapq.heappush(pq,(nn,nr,nc))
