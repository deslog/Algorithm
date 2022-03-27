//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/27.
//

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
var triangle: [Array<Int>] = []
for _ in 1...n{
    let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
    triangle.append(arr)
}

dp[0][0] = triangle[0][0]
dp[1][0] = triangle[0][0]

if n > 1 {
    dp[0][1] = dp[0][0] + triangle[1][0]
    dp[1][1] = dp[1][0] + triangle[1][1]
}

if n > 2 {
    var i = 0
    var j = 1
    
    for k in 2..<n {

        dp[0][k] = max(dp[0][k-1] + triangle[k][i], dp[0][k-1] + triangle[k][i+1])
        dp[1][k] = max(dp[1][k-1] + triangle[k][j], dp[1][k-1] + triangle[k][j+1])
        
        //i, j 바꿔주기
        i = triangle[k][i] > triangle[k][i+1] ? i : i+1
        j = triangle[k][j] > triangle[k][j+1] ? j : j+1
    }
}

print(max(dp[0][n-1], dp[1][n-1]))
