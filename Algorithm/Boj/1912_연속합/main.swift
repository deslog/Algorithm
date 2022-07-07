//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/07.
//

let n = Int(String(readLine()!))!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp = Array(repeating: -9999, count: 100001) // 최소값 0으로 하면 안돼!!!!!

dp[0] = arr[0]

for i in 1..<n {
    dp[i] = max(arr[i], arr[i] + dp[i - 1])
}

print(dp.max()!)
