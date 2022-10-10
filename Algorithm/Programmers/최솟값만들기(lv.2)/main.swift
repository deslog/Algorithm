//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/09.
//

import Foundation

let a = [1, 4, 2]
let b = [5, 4, 4]

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    let newa = A.sorted(by: <)
    let newb = B.sorted(by: >)

    for i in 0..<a.count {
        ans += newa[i] * newb[i]
    }

    return ans
}

print(solution(a, b))
