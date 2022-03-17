//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/17.
//

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: Array(repeating: 0, count: nk[0]+1), count: nk[1]+1)
// dp[k][n] k개 더해서 값이 n

//1개 더해서 값이 n 나오는 경우의 수는 1이라서 1초기화
for i in 0..<nk[0]+1{
    dp[1][i] = 1
}

// dp[k-1][n-l] 구현 (l: 마지막수)
for k in 1..<nk[1]+1 {
    for n in 0..<nk[0]+1 {
        for l in 0..<n+1 {
            dp[k][n] += dp[k-1][n-l]
        }
    }
}

print(dp[nk[1]][nk[0]] % 1000000000)
