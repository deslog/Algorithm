//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/12.
//

import CoreFoundation

let n = Int(String(readLine()!))!
var arr = [0]
for _ in 0..<n {
    arr.append(Int(String(readLine()!))!)
}

var dp = Array(repeating: 0, count: n+1)

// main
dp[0] = 0
for i in 1..<n+1 {
    if i == 1 {
        dp[1] = arr[1]
    } else if i == 2 {
        dp[2] = arr[1] + arr[2]
    } else if i == 3 {
        dp[3] = max(arr[3]+arr[1], arr[3]+arr[2])
    } else {
        dp[i] = max(arr[i] + arr[i-1] + dp[i-3], arr[i] + dp[i-2])
    }
}

print(dp[n])
