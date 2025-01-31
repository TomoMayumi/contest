import sys
n=int(input())
ae=list(map(int,sys.stdin.read().split()))
all=sorted(range(n*5),key=lambda i: ae[i])

right = [n,n,n,n,n]
left = [0,0,0,0,0]
sum = 0
for t in all:
    i = ae[t]
    t = t//n
    left[t]+=1
    l=left.copy()
    l.pop(t)
    l0,l1,l2,l3=l

    right[t]-=1
    r=right.copy()
    r.pop(t)
    r0,r1,r2,r3=r

    t = l0*((l1*r2 + r1*l2)*r3 + r1*r2*l3) + r0*(l1*l2*r3 + (l1*r2 + r1*l2)*l3)
    sum = (sum + t * i)%998244353

print(sum)