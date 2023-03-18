//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/18.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var left = 1
    var right = times.max()! * n
    var answer = 0

    while left <= right {
        var peopleCnt = 0
        let mid = (left + right) / 2

        for time in times {
            peopleCnt += mid / time
            if peopleCnt >= n {
                break
            }
        }

        if peopleCnt >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return Int64(answer)
}

print(solution(6, [7, 10])) // return 28
