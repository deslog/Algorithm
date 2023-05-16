//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/05/15.
//

import Foundation

private func solution() -> Int {
    let n = Int(readLine()!)!
    var minusNums = [Int]()
    var plusNums = [Int]()
    var ones = [Int]()

    for _ in 0..<n {
        let input = Int(readLine()!)!
        // 0 이면 마이너스랑 곱해주는게 개이득
        if input <= 0 {
            minusNums.append(input)
        } else if input == 1 {
            ones.append(input)
        } else {
            plusNums.append(input)
        }
    }

    var sum = 0
    minusNums = minusNums.sorted(by: <)
    plusNums = plusNums.sorted(by: >)

    // minus 처리
    var idx = 0
    while idx < minusNums.count {
        if idx + 1 < minusNums.count {
            sum += minusNums[idx] * minusNums[idx+1]
        } else if idx + 1 >= minusNums.count {
            sum += minusNums[idx]
        }

        idx += 2
    }

    // plus 처리
    idx = 0
    while idx < plusNums.count {
        if idx + 1 < plusNums.count {
            sum += plusNums[idx] * plusNums[idx+1]
        } else if idx + 1 >= plusNums.count {
            sum += plusNums[idx]
        }

        idx += 2
    }

    return sum + ones.count
}

print(solution())
