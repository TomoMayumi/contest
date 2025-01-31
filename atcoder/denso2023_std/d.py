import itertools

n,m = map(int,input().split())
ab = [list(map(int,input().split())) for _ in range(m)]

for l in itertools.product([0,1,2], repeat=n):
    if all([l[a-1]!=l[b-1] for a,b in ab]):
        print("Yes")
        exit(0)

print("No")
