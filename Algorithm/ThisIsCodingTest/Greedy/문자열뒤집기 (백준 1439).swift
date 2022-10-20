//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/19.
//

// 유형별풀이 - 그리디 - 문자열뒤집기 (p.313)
// 백준 1439 뒤집기

import Foundation

// iunput 11001100110011000001
// result 4

var input = readLine()!.map { String($0) }

func solution(_ input: [String]) -> Int {
    var count = 1
    for i in 1..<input.count {
        if input[i] != input[i-1] {
            count += 1
        }
    }
    return count / 2
}

print(solution(input))
