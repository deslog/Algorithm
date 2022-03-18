//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/19.
//

let n = Int(readLine()!)!
var rgbPrice = Array(repeating:[0,0,0], count: n+1) //RGB => 012 순서
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n+1) //dp[집번호][색상]
for i in 1..<n+1 {  // rgbPrice[집번호][012순서대로 가격]
    rgbPrice[i] = readLine()!.split(separator: " ").map {Int(String($0))!}
}


for i in 1..<n+1 {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + rgbPrice[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + rgbPrice[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + rgbPrice[i][2]
}

print(dp[n].min()!)
