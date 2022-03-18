//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/18.


let n = Int(readLine()!)!
var input: [Int] = []
for _ in 0..<n {
    input.append(Int(readLine()!)!)
}
var dp = Array(repeating: 0, count: input.max()!+1)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<input.max()!+1 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for i in input {
    print(dp[i])
}

