//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/13.
//

let n = Int(readLine()!)!
let inputArray = readLine()!.split(separator: " ").map { Int(String($0))}
var dp: [Int] = []

dp.append(inputArray[0]!)

for i in 1..<n {
    for j in 1..<i+1 {
        dp[i] = max(dp[i], dp[i-1]+inputArray[j]!)
    }
}

print(dp)
