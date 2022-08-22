//
//  시간초과.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/22.
//
// filter 사용시 시간 초과

import Foundationimport Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failure = [Int: Double]()

    for i in 1..<N+1 {
        let failNum = stages.filter({ $0 == i }).count
        let clearNum = stages.filter({ $0 >= i }).count
        failure[i] = Double(failNum) / Double(clearNum)
    }
    let sortArr = failure.sorted(by: <).sorted(by: { $0.1 > $1.1 })
    let result = sortArr.map{ $0.key }

    return result
}
