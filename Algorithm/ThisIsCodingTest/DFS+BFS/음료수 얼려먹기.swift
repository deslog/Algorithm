//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/22.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]
var iceFrame = [[Int]]()

for _ in 0..<n {
    iceFrame.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// 방향키: 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

private func dfs(x: Int, y: Int) -> Bool {

    // 범위 벗어나면 끝
    if x < 0 || y < 0 || x >= n || y >= m {
        return false
    }

    // 방문처리 안된 곳이라면 더 파고들어서 인접 노드 확인
    if iceFrame[x][y] == 0 {
        iceFrame[x][y] = 1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            dfs(x: nx, y: ny)
        }
        return true
    }
    return false
}

var result = 0
for i in 0..<n {
    for j in 0..<m {
        if dfs(x: i, y: j) {
            result += 1
        }
    }
}

print(result)
