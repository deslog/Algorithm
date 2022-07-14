//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/14.
//

var n = Int(String(readLine()!))!
var dp = Array(repeating: 5001, count: n+1)

if n > 2 {
    dp[3] = 1
    if n > 4{
        dp[5] = 1
    }
}

if n > 5 {
    for i in 6..<n+1 {
        dp[i] = min(dp[i-3]+1, dp[i-5]+1)
    }
}

if n == 4 {
    print(-1)
} else {
    if dp[n] > 5001 {
        print(-1)
    } else {
        print(dp[n])
    }
}
