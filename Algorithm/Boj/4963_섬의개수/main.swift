//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/22.
//

import Foundation

// 상하좌우 왼쪽위 왼쪽아래 오른쪽위 오른쪽아래
let dx = [-1, 1, 0, 0, -1, 1, -1, 1]
let dy = [0, 0, -1, 1, -1, -1, 1, 1]

while true {
    let wh = readLine()!.split(separator: " ").map{ Int($0)! }

    if wh == [0, 0] {
        break
    }

    var islandMap = [[Int]]()
    for _ in 0..<wh[1] {
        islandMap.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }

    // MARK: - DFS 함수
    func dfs(x: Int, y: Int) -> Bool {
        if x < 0 || x >= wh[1] || y < 0 || y >= wh[0] {
            return false
        }

        if islandMap[x][y] == 1 {
            islandMap[x][y] = 0
            for i in 0..<8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                dfs(x: nx, y: ny)
            }
            return true
        }
        return false
    }

    // MARK: - main
    var result = 0
    for i in 0..<wh[1] {
        for j in 0..<wh[0] {
            if dfs(x: i, y: j) {
                result += 1
            }
        }
    }
    print(result)
}
