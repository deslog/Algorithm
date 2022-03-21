//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/21.
//

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n+1)

//sum 함수 구현
func sum(_ numbers: [Int]) -> Int {
    return numbers.reduce(0, +)
}

// 한자리수는 무조건 1개씩
for i in 0...9 {
    dp[1][i] = 1
}

if n ==  1 {
    print(sum(dp[1]))
} else {
    for i in 2..<n+1 {
        for j in 0...9 {
            for k in j...9 {
                dp[i][j] = (dp[i][j] + dp[i-1][k]) % 10007
            }
        }
    }
    print(sum(dp[n])%10007)
}
