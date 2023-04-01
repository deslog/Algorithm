//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/26.
//

import Foundation

//규칙 잘못 생각함
//let n = Int(readLine()!)!
//var dp = Array(repeating: 0, count: n+1)
//
//dp[1] = 1
//dp[2] = 2
//
//for i in 3..<n+1 {
//    if i % 2 == 0 {
//        dp[i] = dp[i-2]*2
//    } else {
//        dp[i] = dp[i-1]
//    }
//}
//
//print(dp[n])

import Foundation

// 예외처리 생각하자. n=1일경우!
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

if n >= 2 {
    dp[1] = 1
    dp[2] = 2

    for i in 3..<n+1 {
        dp[i] = (dp[i-2] + dp[i-1]) % 10007
    }
}

if n == 1 {
    print(1)
} else if n == 2 {
    print(2)
} else {
    print(dp[n])
}
