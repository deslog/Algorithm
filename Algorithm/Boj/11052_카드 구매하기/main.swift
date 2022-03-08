//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/08.
//

let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: n+1)

for i in 1..<n+1 {
    for j in 1..<i+1 {
        dp[i] = max(dp[i], dp[i-j]+p[j-1])
    }
}
print(dp[n])
