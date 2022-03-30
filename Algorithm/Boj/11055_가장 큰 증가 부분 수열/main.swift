//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/29.
//

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp: [Int] = []

for k in 0..<n {
    dp.append(1)
    for i in 0..<k+1 {
        if arr[i] < arr[k] {
            dp[k] = max(dp[k], dp[i] + 1)
        }
    }
}

print(dp)
