//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/22.
//

// maxCounters

import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

// -- 시간초과 --
//var N = 5
//var A = [3, 4, 4, 6, 1, 4, 4]
//public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
//    var answer = Array(repeating: 0, count: N)
//
//    for idx in 0..<A.count {
//        if A[idx] == N+1 {
//            let max = answer.max()!
//            answer = Array(repeating: max, count: N)
//        } else {
//            answer[A[idx]-1] += 1
//        }
//        print(answer)
//    }
//
//    return answer
//}
//
//
//print(solution(N, &A))
// -- 시간초과 --

var N = 5
var A = [3, 4, 4, 6, 1, 4, 4]

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var answer = Array(repeating: 0, count: N)
    var currentMax = 0
    var nextMax = 0

    for a in A {
        // N+1 이 아니라면
        if a != N+1 {
            // +1 연산해줘야해
            // 그전에 currentmax값이 존재한다면, 그 값으로 바꿔주고
            // (max값보다 작을경우, 바꿔줘, 만약 크면? 이미 +1씩 더하고 있다는 뜻
            if answer[a-1] <= currentMax {
                answer[a-1] = currentMax
            }

            answer[a-1] += 1

            // 만약 지금 +1 해준 값이 max가 될 가능성이 있다면
            // nextmax에 넣어줘,,, (다음에 바궈줄때 사용)
            if answer[a-1] > nextMax {
                nextMax = answer[a-1]
            }
        } else {
            currentMax = nextMax
        }
    }

    // 최댓값으로 바꿔지지 않은 것들 바꿔주기
    for idx in 0..<answer.count {
        if answer[idx] < currentMax {
            answer[idx] = currentMax
        }
    }

    return answer
}
print(solution(N, &A))
