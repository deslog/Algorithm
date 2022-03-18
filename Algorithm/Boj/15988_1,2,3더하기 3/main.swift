//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/18.


let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!
    var dp = Array(repeating: 0, count: num+1)
    
    if num == 0 {
        print(0)
    } else if num == 1 {
        print(1)
    } else if num == 2 {
        print(2)
    } else if num == 3 {
        print(4)
    } else {
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        
        for j in 4..<num+1 {
            dp[j] = (dp[j-1] + dp[j-2] + dp[j-3]) % 1000000009
        }
        print(dp[num])
    }
}
