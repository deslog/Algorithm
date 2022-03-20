//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/20.
//

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

dp[0] = 1
dp[1] = 3

for i in 2..<n+1 {
    dp[i] = ((2*dp[i-1]) + dp[i-2]) % 9901
}

print(dp[n])
