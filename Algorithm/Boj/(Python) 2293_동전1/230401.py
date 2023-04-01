n, k = map(int, input().split())
coin = []
for _ in range(0, n):
    coin.append(int(input()))

dp = [0] * (k+1)
dp[0] = 1

for c in coin:
    for i in range(c, k+1):
        dp[i] = dp[i] + dp[i-c]

print(dp[k])