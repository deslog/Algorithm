//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/03.
//

import Foundation

// 미쳐... 입력과 출력 모두 string으로 해야하네.. 참나 어이가없다!

private func solution(_ number: String) -> String {
    let arr = number.map{ Int(String($0))! }.sorted(by: >)

    if !arr.contains(0) || arr.reduce(0, +) % 3 != 0 {
        return "-1"
    }
    return arr.map{ String($0) }.joined()
}

let number = readLine()!
print(solution(number))
