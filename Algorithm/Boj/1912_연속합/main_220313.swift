//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/13.
//

let n = Int(String(readLine()!))!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: -1001, count: 100001)

dp[0] = arr[0]

for i in 1..<n{
    dp[i] = max(arr[i],dp[i - 1] + arr[i])
}
print(dp.max()!)
