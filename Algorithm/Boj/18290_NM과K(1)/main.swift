//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/14.
//

import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nmk[0]
let m = nmk[1]
let k = nmk[2]
var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var answer = -999999

let dx = [-1, 1, 0, 0] // 상하좌우
let dy = [0, 0, -1, 1]

private func dfs(px: Int, py: Int, depth: Int, maxNum: Int) {
    if depth == k {
        answer = max(maxNum, answer)
        return
    }

    for x in px..<n {
        let tempY = x == px ? py : 0
        for y in tempY..<m {
            if visited[x][y] {
                continue
            }

            var flag = true
            // 해당 xy 상하좌우에 하나라도 방문한 이력이 있으면 false
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if nx >= 0, ny >= 0, nx < n, ny < m {
                    if visited[nx][ny] {
                        flag = false
                    }
                }
            }

            // flag가 아직 true면 상하좌우 아무데도 아직 visited 한적이 없다는 뜻
            // 해당 위치 (xy)에 방문해서 answer에 더해주고 dfs 돌려주자
            if flag {
                visited[x][y] = true
                dfs(px: x, py: y, depth: depth + 1, maxNum: maxNum + arr[x][y])
                visited[x][y] = false
            }
        }
    }
}

dfs(px: 0, py: 0, depth: 0, maxNum: 0)
print(answer)
