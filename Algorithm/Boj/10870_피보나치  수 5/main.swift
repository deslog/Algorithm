//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/30.
//

import Foundation

// 탑다운방식 (메모이제이션)
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 21)

func fiboTopDown(num: Int) -> Int {
    if num == 0 {
        return 0
    } else if num == 1 {
        return 1
    }

    if dp[num] != 0 {
        return dp[num]
    }

    dp[num] = fiboTopDown(num: num - 1) + fiboTopDown(num: num - 2)
    return dp[num]
}

print(fiboTopDown(num: n))

// 보텀업방식 (이전의 작은 문제들을 해결해나가면서 차례대로 num을 구함)
func fiboBottomUp(num: Int) -> Int {
    dp[0] = 0
    dp[1] = 1

    if num == 0 || num == 1 {
        return dp[num]
    }

    for i in 2...num {
        dp[i] = dp[i-1] + dp[i-2]
    }

    return dp[num]
}

print(fiboBottomUp(num: n))
