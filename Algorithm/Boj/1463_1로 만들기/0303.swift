//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/03.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)

for i in 2..<n+1 {
    dp[i] = dp[i-1] + 1
    // 1을 빼고 시작하는 이유는 다음에 계산할 나누기가 1을 뺀 값보다 작거나 큼에 따라 어차피 교체되기 때문이다.
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3]+1)
    }
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2]+1)
    // 1을 더하는 것은 dp는 결과가 아닌 계산한 횟수를 저장하는 것 이기 때문이다.
    // dp[i]에는 더하지 않는 이유는 이미 1을 뺄 때 1을 더해준 이력이 있기 때문이다.
    }
}

print(dp[n])
