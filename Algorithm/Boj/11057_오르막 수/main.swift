//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/21.
//

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n+1)

// 한자리수는 무조건 1개씩
for i in 0...9 {
    dp[1][i] = 1
}

for i in 2..<n+1 {
    for j in 0...9 {
        for k in j...9 {
            dp[i][k] += dp[i-1][j]
            dp[i][k] %= 10007
        }
    }
}

func sum(_ numbers: [Int]) -> Int {
    return numbers.reduce(0, +)
}

print(sum(dp[n]))
