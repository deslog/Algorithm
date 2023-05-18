//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/05/16.
//

import Foundation

private func solution() -> Int {
    let n = Int(readLine()!)!
    var xy = [[Int]]()

    for _ in 0..<n {
        xy.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }

    xy = xy.sorted{ $0[0] < $1[0] }

    var answer = 0
    var start = xy[0][0]
    var end = xy[0][1]

    for i in 1..<n {
        if end < xy[i][0] {
            answer += end - start
            start = xy[i][0]
            end = xy[i][1]
        } else {
            end = max(xy[i][1], end)
        }
    }

    answer += end - start
    return answer
}

print(solution())
