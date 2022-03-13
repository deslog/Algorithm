//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/13.
//

let n = Int(readLine()!)!
let inputArray = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp: [Int] = []

for i in 0..<n {
    dp.append(1)
    for j in 0..<i+1 {
        if inputArray[j] < inputArray[i] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(dp.max()!)
