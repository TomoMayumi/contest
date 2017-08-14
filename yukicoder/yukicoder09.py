import heapq

n=input()
a=map(int,raw_input().split())
heapq.heapify(a)
a=[(i,0) for i in a]
b=[int(i)/2 for i in raw_input().split()]

def check(i):
    pq=a[:]
    for elevel in b[i:]+b[:i]:
        level,cnt=heapq.heappop(pq)
        heapq.heappush(pq,(level+elevel,cnt+1))
    return max(y for x,y in pq)

print(min(check(i) for i in range(n)))