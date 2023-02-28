//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/28.
//

import Foundation

let mn = readLine()!.split(separator: " ").map{ Int($0)! }

var banner = [[Int]]()
for _ in 0..<mn[0] {
    banner.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var cnt = 0

// 방향키 : 상 하 좌 우 왼쪽위 왼쪽아래 오른쪽위 오른쪽아래
let dx = [-1, 1, 0, 0, -1, 1, -1, 1]
let dy = [0, 0, -1, 1, -1, -1, 1, 1]

private func dfs(x: Int, y: Int) {
    banner[x][y] = 0

    for i in 0..<8 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if nx < 0 || ny < 0 || nx >= mn[0] || ny >= mn[1] {
            continue
        }

        if banner[nx][ny] == 1 {
            dfs(x: nx, y: ny)
        }
    }
}

for i in 0..<mn[0] {
    for j in 0..<mn[1] {
        if banner[i][j] == 1 {
            cnt += 1
            dfs(x: i, y: j)
        }
    }
}

print(cnt)
