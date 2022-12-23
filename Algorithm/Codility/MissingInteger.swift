//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/22.
//

import Foundation


// 연습문제
// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

var A = [1, 3, 6, 4, 1, 2]
public func solution(_ A : inout [Int]) -> Int {
    let newA = Array(Set(A.sorted()))
    var answer = 0

    for i in 1..<100000 {
        if !newA.contains(i) {
            answer = i
            break
        }
    }

    return answer
}

print(solution(&A))
