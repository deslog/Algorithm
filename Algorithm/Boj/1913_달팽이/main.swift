//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/16.
//

import Foundation

// input
var n = Int(readLine()!)!
let printN = n
let place = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: -1 , count: n), count: n)

// 상 우 하 좌
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

// 초기 설정
var square = 3
var y = n/2
var x = n/2
graph[y][x] = 1
var num = 2

// 상우하좌 할당량을 줄 변수 선언
var up = -1
var right = -1
var down = -1
var left = -1


while y != 0, x != 0 {
    while num <= square * square {
        // 시작점이 될 부분
        if y == n/2, x == n/2 {
            up = square
            right = square - 2
            down = square - 1
            left = square - 1

            // 상으로 이동
            y += dy[0]
            x += dx[0]
            up -= 1
        } else if right > 0 {
            y += dy[1]
            x += dx[1]
            right -= 1
        } else if down > 0 {
            y += dy[2]
            x += dx[2]
            down -= 1
        } else if left > 0 {
            y += dy[3]
            x += dx[3]
            left -= 1
        } else if up > 0 {
            y += dy[0]
            x += dx[0]
            up -= 1
        }

        graph[y][x] = num
        num += 1
    }

    square += 2
    n -= 2
}

var answerX = -1
var answerY = -1

for i in 0..<printN {
    for j in 0..<printN {
        print(graph[i][j], terminator: " ")
        if graph[i][j] == place {
            answerX = i + 1
            answerY = j + 1
        }
    }
    print()
}

print("\(answerX) \(answerY)")
