//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/23.
//

import Foundation

//while let N = Int(readLine()!) {
//    print(solution(N))
//}
//
//private func solution(_ N: Int) -> Int {
//    let N = N ?? 0
//    var sum = 0
//
//    for i in 1..<N+1 {
//        sum += (N / i) * i
//    }
//
//    return sum
//}

    private func solution() {
        let accumulate = accumulateSum()
        let T = Int(readLine()!)!

        for _ in 0..<T {
            let num = Int(readLine()!)!
            print(accumulate[num])
        }
    }

    private func accumulateSum() -> [Int] {
        var div = Array(repeating: 0, count: 1000001)
        var sum = Array(repeating: 0, count: 1000001)

        for i in 1...1000000 {
            var j = 1
            while i*j <= 1000000 {
                div[i*j] += j
                j += 1
            }
        }
        sum[1] = div[1]
        for i in 2..<div.count {
            sum[i] = sum[i-1] + div[i]
        }

        return sum
    }

    solution()
