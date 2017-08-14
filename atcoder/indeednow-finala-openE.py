def eq(a,b,eps):
  d=abs(a-b)
  return d<eps or d/b<eps


n,m=map(int,input().split())
ni=[0]*(n+1)
good=[[] for _ in range(n+1)]
for _ in range(m):
  a,b=map(int,input().split())
  ni[a]+=1
  good[b].append(a)

pr=[1]*(n+1)
#update=True
#while update:
#  update=False
for _ in range(1000):
  for i in range(1,n+1):
#    t=pr[i]
    pr[i]=0.1+0.9*sum(pr[j]/ni[j] for j in good[i])
#    if not eq(t,pr[i],1e-7): update=True

for i in pr[1:]:
  print(i)