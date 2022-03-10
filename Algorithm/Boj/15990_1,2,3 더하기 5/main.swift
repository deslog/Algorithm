//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/10.
//

let n = Int(readLine()!)!
var dp = [[Int]](repeating: Array(repeating: 0, count: 4), count: 100001)

dp[1] = [0, 1, 0, 0]
dp[2] = [0, 0, 1, 0]
dp[3] = [0, 1, 1, 1]

for j in 4..<100001 {
    dp[j][1] = dp[j-1][2]%1000000009 + dp[j-1][3]%1000000009
    dp[j][2] = dp[j-2][1]%1000000009 + dp[j-2][3]%1000000009
    dp[j][3] = dp[j-3][1]%1000000009 + dp[j-3][2]%1000000009
}


for _ in 1..<n+1 {
    let i = Int(readLine()!)!
    print((dp[i][1]+dp[i][2]+dp[i][3])%1000000009)
}
