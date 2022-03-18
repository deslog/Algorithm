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

for i in 0..<n {
    var dp = Array(repeating: 0, count: input[i]+1)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    for j in 4..<input[i]+1 {
        dp[j] = (dp[j-1] + dp[j-2] + dp[j-3]) % 1000000009
    }
    print(dp[input[i]])
}
