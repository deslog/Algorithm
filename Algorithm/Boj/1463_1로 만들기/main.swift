//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/26.
//

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

// dp: i를 1로 만드는 횟수를 담은 배열
for i in 2..<n+1 {
    dp[i] = dp[i-1] + 1
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3]+1)
    }
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2]+1)
    }
}

print(dp[10])
