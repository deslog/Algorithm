//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/23.
//

import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted()
    var left = 0
    var right = distance
    var answer = 0

    while left <= right {
        let mid = (left + right) / 2
        var preRock = 0
        var removeRock = 0
        var minDistance = 1000000001

        for rock in rocks {
            if rock - preRock < mid {
                // 돌 지우니까 pre rock은 안바꿔줌 (없어진 돌이니까!)
                removeRock += 1
            } else {
                minDistance = min(rock - preRock, minDistance)
                preRock = rock
            }
        }

        if n >= removeRock {
            answer = minDistance // 딱 맞는경우 이걸로
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return answer
}

print(solution(25, [2, 14, 11, 21, 17], 2))
