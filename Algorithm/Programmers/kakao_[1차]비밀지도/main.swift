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

    for i in 1..<N+1 {
        let failNum = stages.filter({ $0 == i }).count
        let clearNum = stages.filter({ $0 >= i }).count
        failure[i] = Double(failNum) / Double(clearNum)
    }
    let sortArr = failure.sorted(by: <).sorted(by: { $0.1 > $1.1 })
//    print(sortArr)
    let result = sortArr.map{ $0.key }
//    print(result)
    return result
}

solution(N, stages)
