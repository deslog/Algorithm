//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/17.
//

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: Array(repeating: 0, count: nk[0]+1), count: nk[1]+1)
// dp[k][n] k개 더해서 값이 n

for k in 1..<nk[1]+1 {
    for n in 0..<nk[0]+1 {
        if n == 0 {
            dp[k][0] = 1
        } else {
            dp[k][n] = (dp[k-1][n]+dp[k][n-1]) % 1000000000
        }
    }
}

print(dp[nk[1]][nk[0]])
