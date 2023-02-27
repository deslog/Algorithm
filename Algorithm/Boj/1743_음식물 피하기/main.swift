//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/27.
//

import Foundation

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(repeating: Array(repeating: 0, count: nmk[1]), count: nmk[0])
var answer = -9999
var cnt = 0

// MARK: - 방향키 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// MARK: - 음쓰 있으면 -1, 없으면 0
for _ in 0..<nmk[2] {
    let rc = readLine()!.split(separator: " ").map{ Int($0)! }
    arr[rc[0]-1][rc[1]-1] = -1
}

private func dfs(x: Int, y: Int) {
    cnt += 1
    arr[x][y] = cnt

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if nx < 0 || ny < 0 || nx >= nmk[0] || ny >= nmk[1] {
            continue
        }

        if arr[nx][ny] == -1 {
            arr[nx][ny] = cnt
            dfs(x: nx, y: ny)
        }
    }
}

for i in 0..<nmk[0] {
    for j in 0..<nmk[1] {
        if arr[i][j] == -1 {
            cnt = 0
            dfs(x: i, y: j)
        }

        if answer < arr[i][j] {
            answer = arr[i][j]
        }
    }
}

print(answer)
