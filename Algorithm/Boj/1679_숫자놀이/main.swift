//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/28.
//

import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!
var dp = Array(repeating: [Int](), count: k+1)
var visited = Array(repeating: false, count: (nums.max()! * k)+1)

for num in nums {
    visited[num] = true
    dp[1].append(num)
}

for i in 2..<k+1 {
    let previous = dp[i-1]
    for p in previous {
        for num in nums {
            visited[num+p] = true
            if !dp[i].contains(num+p) {
                dp[i].append(num+p)
            }
        }
    }
}

for j in 1..<(nums.max()!*k)+1 {
    if visited[j] == false {
        print(j % 2 == 0 ? "holsoon win at \(j)" : "jjaksoon win at \(j)")
        break
    }
}
