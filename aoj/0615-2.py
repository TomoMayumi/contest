n = int(input())
a = [int(input()) for _ in range(n)]
dp = [[0]*n for _ in range(n)]

for i in range(n):
    if i%2 == n%2:
        for l,r in [(t,(t+i)%n) for t in range(n)]:
            dp[l][r] = dp[(l+1)%n][r] if a[l]>a[r] else dp[l][(r+n-1)%n]
    else:
        for l,r in [(t,(t+i)%n) for t in range(n)]:
            dp[l][r] = max(a[l] + dp[(l+1)%n][r],a[r] + dp[l][(r+n-1)%n])

print(max(dp[(i+1)%n][i] for i in range(n)))
