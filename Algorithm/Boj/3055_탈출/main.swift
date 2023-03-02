//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/02.
//

import Foundation

let rc = readLine()!.split(separator: " ").map{ Int($0)! }
var maps = [[String]]()
var start = [0, 0]
var end = [0, 0]
var water = [[Int]]()

for i in 0..<rc[0] {
    let temp = readLine()!.map{ String($0) }
    if temp.contains("D") {
        end = [i, temp.firstIndex(of: "D")!]
    }

    if temp.contains("S") {
        start = [i, temp.firstIndex(of: "S")!]
    }

    for t in temp {
        if t == "*" {
            water.append([i, temp.firstIndex(of: t)!])
        }
    }

    maps.append(temp)
}

var visited = Array(repeating: Array(repeating: false, count: rc[1]), count: rc[0])
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func bfs() {
    var flag = false
    var queue = [[Int]]() // [x, y, depth]
    queue.append([start[0], start[1], 0])
    visited[start[0]][start[1]] = true
    var waterfillCount = -999

    while !queue.isEmpty {
        // 고슴도치 S 이동시켜주기
        let q = queue.removeFirst()
        let x = q[0]
        let y = q[1]
        let depth = q[2]

        // 어차피 depth는 순서대로 증가 -> 변하면 하나 물채워진 지도로 사용
        if waterfillCount != depth {
            waterfillCount = depth
            fillwater()
        }

        if x == end[0], y == end[1] {
            print(depth)
            flag = true
            break
        }

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || ny < 0 || nx >= rc[0] || ny >= rc[1] {
                continue
            }

            // 돌이거나 물이면 pass
            if maps[nx][ny] == "X" || maps[nx][ny] == "*" {
                continue
            }

            // maps에서 비어있는곳이면, 큐에 넣어줌으로써 인접노드로 추가
            // visited 꼭해줘야 시간초과 안남 ;
            if (maps[nx][ny] == "." || maps[nx][ny] == "D"), !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append([nx, ny, depth + 1])
            }
        }
    }

    if !flag {
        print("KAKTUS")
    }
}

// 물을 채워주는 함수
// 어차피 water 내부에서만 순서대로 돌리면돼
// 그리고 temp로 갱신시켜주자... O(N^2) -> O(N) 쌉가능 (이지만 두번째 시도도 시간초과가 나고 말았다)
func fillwater() {
    var temp = [[Int]]()

    for w in water {
        let waterX = w[0]
        let waterY = w[1]

        for i in 0..<4 {
            let nwx = waterX + dx[i]
            let nwy = waterY + dy[i]

            if nwx < 0 || nwy < 0 || nwx >= rc[0] || nwy >= rc[1] {
                continue
            }

            if maps[nwx][nwy] == "." {
                maps[nwx][nwy] = "*"
                temp.append([nwx, nwy])
            }
        }
    }
    water = temp
}

// ❌ 첫번째 시도 -> 시간초과
// 물 이동시키는거 -> maps 만 변화시켜주면 되는데 쓸데없이 removeFirst조지고 있었음
func timeover_fillwater() {
    let waterCnt = water.count
    var maps = maps

    for _ in 0..<waterCnt {
        let waterPlace = water.removeFirst()
        let waterX = waterPlace[0]
        let waterY = waterPlace[1]

        for i in 0..<4 {
            let nwx = waterX + dx[i]
            let nwy = waterY + dy[i]

            if nwx < 0 || nwy < 0 || nwx >= rc[0] || nwy >= rc[1] {
                continue
            }

            if maps[nwx][nwy] == "X" || maps[nwx][nwy] == "*" {
                continue
            }

            maps[nwx][nwy] = "*"
            water.append([nwx, nwy])
        }
    }
}

bfs()
