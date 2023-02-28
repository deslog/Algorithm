//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/28.
//

import Foundation

let rc = readLine()!.split(separator: " ").map{ Int($0)! }
var field = [[String]]()
for _ in 0..<rc[0] {
    field.append(readLine()!.map{ String($0) })
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var oCnt = 0
var vCnt = 0
var answer = [0, 0] // 양 늑대

private func dfs(x: Int, y: Int) {
    switch field[x][y] {
    case "o":
        oCnt += 1
    case "v":
        vCnt += 1
    default:
        break
    }

    field[x][y] = "#" // 방문처리

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if nx < 0 || ny < 0 || nx >= rc[0] || ny >= rc[1] {
            continue
        }

        if field[nx][ny] != "#" {
            dfs(x: nx, y: ny)
        }
    }
}

for i in 0..<rc[0] {
    for j in 0..<rc[1] {
        if field[i][j] != "#" {
            oCnt = 0
            vCnt = 0
            dfs(x: i, y: j)

            if vCnt >= oCnt {
                answer[1] += vCnt
            } else {
                answer[0] += oCnt
            }
        }
    }
}

print("\(answer[0]) \(answer[1])")
