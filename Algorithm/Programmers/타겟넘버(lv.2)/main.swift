//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/24.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var queue = [(Int, Int)]()
    queue.append((-numbers[0], 0))
    queue.append((numbers[0], 0))
    var answer = 0

    while !queue.isEmpty {
        let q = queue.removeLast()
        let num = q.0
        var idx = q.1
        idx += 1
        if idx < numbers.count {
            queue.append((num+numbers[idx], idx))
            queue.append((num-numbers[idx], idx))
        } else {
            if target == num {
                answer += 1
            }
        }
    }

    return answer
}

let numbers = [1, 1, 1, 1, 1]
let target = 3

print(solution(numbers, target))
