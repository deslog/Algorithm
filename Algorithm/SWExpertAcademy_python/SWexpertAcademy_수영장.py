T = int(input())
# 여러개의 테스트 케이스가 주어지므로, 각각을 처리합니다.

for test_case in range(1, T + 1):
    price = list(map(int, input().split()))
    plan = list(map(int, input().split()))
    dp = [1000000] * 15
    dp[1] = min(plan[0] * price[0], price[1])
    dp[2] = min(dp[1] + (plan[1] * price[0]), dp[1] + price[1])
    dp[3] = min(dp[2] + (plan[2] * price[0]), dp[2] + price[1], price[2])
    dp[12] = price[3]

    for month in range(4, 13):
        dp[month] = min(dp[month], dp[month-1] + (plan[month-1] * price[0]), dp[month-1] + price[1], dp[month-3]+price[2])

    print(dp)
    print("#%d %d" %(test_case, dp[12]))