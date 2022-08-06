//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/01.
//

import Foundation

let N = 5
let stages = [2, 1, 2, 6, 2, 4, 3, 3]

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failure = [Int: Double]()
    var total = Double(stages.count) // 8.0
    var countArr = Array(repeating: 0, count: N+2) // [0, 0, 0, 0, 0, 0]

    for num in stages {
        countArr[num] += 1 // [0, 1, 3, 2, 1, 0, 1]
    }

    for i in 1..<N+1 {
        if countArr[i] == 0 {
            failure[i] = 0.0
        } else {
            total = total - Double(countArr[i])
            failure[i] = Double(countArr[i]) / total
        }
    }
    let sortArr = failure.sorted(by: <).sorted(by: { $0.1 > $1.1 })
//    print(sortArr)
    let result = sortArr.map{ $0.key }
//    print(result)
    return result
}

solution(N, stages)

