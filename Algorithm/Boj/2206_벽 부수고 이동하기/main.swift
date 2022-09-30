//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/09/30.
//

import Foundation

var nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0]
let m = nm[1]
var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.map{ Int(String($0))! })
}

var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n) // x y break
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1] // 위 아래 왼 오

func bfs() -> Int {
    var idx = 0
    var queue = [(Int, Int, Int)]()
    queue.append((0, 0, 0))
    visited[0][0][0] = 1

    while idx < queue.count {
        let y = queue[idx].0
        let x = queue[idx].1
        let wallbreak = queue[idx].2

        //마지막 인덱스에 도착했따면 끝!
        if y == n-1, x == m-1 {
            return visited[y][x][wallbreak]
        }

        // 방향키 돌려
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]

            if ny >= n || nx >= m || nx < 0 || ny < 0 {
                continue
            }

            if visited[y][x][wallbreak] == 1 {
                continue
            }

            if map[ny][nx] == 0 {
                visited[ny][nx][wallbreak] = visited[y][x][wallbreak] + 1 // y,x,wallbreak에서 왓으니까 그 거리보다 +=1
                queue.append((ny, nx, wallbreak))
            } else if map[ny][nx] == 1, wallbreak == 0 {
                visited[ny][nx][1] = visited[y][x][wallbreak] + 1
                queue.append((ny, nx, 1))
            }
        }
        idx += 1
    }
    return -1
}

print(bfs())
