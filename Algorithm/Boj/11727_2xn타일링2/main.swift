//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/05.
//


let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)

if n == 1 {
    print(1)
} else if n == 2 {
    print(3)
} else {
    dp[1] = 1
    dp[2] = 3
    
    for i in 3..<n+1 {
        dp[i] = (dp[i-1] + 2*dp[i-2]) % 10007
    }
    print(dp[n])
}

