//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/05.
//

import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 12)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<12 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n])
}
