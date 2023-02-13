//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/13.
//

import Foundation

let p = Int(readLine()!)!

private func solution() {
    // test case 만큼 반복
    for i in 1...p {
        var heightArr = readLine()!.split(separator: " ").map{ Int($0)! }
        heightArr.removeFirst()
        var footCnt = 0

        for j in 0..<heightArr.count {
            var minHeight = 999999999
            var minIdx = j

            for k in 0..<j {
                // 앞에 더 큰애 있나? & 제일작은애 누군가?
                if heightArr[j] < heightArr[k], minHeight > heightArr[k] {
                    minHeight = heightArr[k]
                    minIdx = k
                }
            }

            if minIdx != j {
                let temp = heightArr[j]
                heightArr.remove(at: j)
                heightArr.insert(temp, at: minIdx)
                footCnt += j - minIdx
            }
        }
        print("\(i) \(footCnt)")
    }
}

solution()
