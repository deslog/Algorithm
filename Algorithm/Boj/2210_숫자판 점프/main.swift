//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/22.
//

import Foundation

var matrix = [[Int]]()
for _ in 0..<5 {
    matrix.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// 방향키: 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var answerList = [String]()

private func dfs(x: Int, y: Int, number: String) {
    var number = number
    number += String(matrix[x][y])

    if number.count == 6 {
        answerList.append(number)
        return
    }

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 {
            continue
        }

        dfs(x: nx, y: ny, number: number)
    }
}

for i in 0..<5 {
    for j in 0..<5 {
        dfs(x: i, y: j, number: "")
    }
}

print(Set(answerList).count)
