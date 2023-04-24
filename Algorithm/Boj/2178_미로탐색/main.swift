//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/04/24.
//

import Foundation

func bfs() {
    // MARK: - input
    let nm = readLine()!.split(separator: " ").map{ Int($0)! }
    var miro = [[Int]]()

    for _ in 0..<nm[0] {
        miro.append(readLine()!.map{ Int(String($0))! })
    }

    var queue = [(Int, Int, Int)]()
    queue.append((0, 0, 1)) // (1, 1)부터 시작, depth는 1
    miro[0][0] = -1 // -1 로 방문처리
    var idx = 0

    // MARK: - 방향키
    let dx = [-1, 1, 0, 0] // 위 아래 좌 우
    let dy = [0, 0, -1, 1]

    // MARK: - BFS (인덱스 기준으로 돌리기)
    while idx <= queue.count {
        let x = queue[idx].0
        let y = queue[idx].1
        let depth = queue[idx].2

        if x == nm[0] - 1, y == nm[1] - 1 {
            print(queue)
            print(depth)
            break
        }

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
                continue
            }

            if miro[nx][ny] == 1 {
                miro[nx][ny] = -1 // 방문처리
                queue.append((nx, ny, depth + 1))
            }
        }

        idx += 1
    }
}

bfs()
