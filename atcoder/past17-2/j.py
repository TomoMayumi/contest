from collections import defaultdict

n=int(input())
list = defaultdict(int)
for _ in range(n):
    a,b=map(int, input().split())
    list[a]+=1
    list[b+1]-=1

t = [int(input()) for _ in range(int(input()))]

for ti in t:
    list[ti]+=0

newlist={}
newlist[0]=0
cnt=0
for k,v in sorted(list.items()):
    cnt+=v
    newlist[k]=cnt

print(*[newlist[ti] for ti in t],sep='\n')
