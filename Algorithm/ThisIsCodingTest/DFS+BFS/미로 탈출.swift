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
var miro = [[Int]]()

for _ in 0..<n {
    miro.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

//상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

private func bfs(x: Int, y: Int) -> Int {
    var queue = [(Int, Int)]()
    queue.append((x, y))

    while !queue.isEmpty {
        let temp = queue.removeFirst()
        let x = temp.0
        let y = temp.1

        // 지금 위치에서 상하좌우 돌려서 queue에 넣어줄거임
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            // 범위 넘거나 괴물있으면 그냥 패스
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }

            if miro[nx][ny] == 0 {
                continue
            }

            if miro[nx][ny] == 1 {
                miro[nx][ny] = miro[x][y] + 1
                queue.append((nx, ny))
            }
        }
    }
    return miro[n-1][m-1]
}

print(bfs(x: 0, y: 0))
