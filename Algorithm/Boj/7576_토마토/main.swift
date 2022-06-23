//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/06/23.
//

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = mn[0]
let n = mn[1]
var box = [[Int]]()
var day = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)

for _ in 0..<mn[1] {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    box.append(temp)
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var queue = [[Int]]()
var lastIdx = [0, 0]
var idx = 0
var isCooked = true

for i in 0..<n {
    for j in 0..<m {
        if box[i][j] == 1 {
            queue.append([i, j])
        }
    }
}

func bfs() {
    while idx < queue.count {
        let pop = queue[idx]
        idx += 1

        for k in 0..<4 {
            let nx = pop[0] + dx[k]
            let ny = pop[1] + dy[k]
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                if box[nx][ny] == 0 {
                    box[nx][ny] = 1
                    queue.append([nx, ny])
                    day[nx][ny] = day[pop[0]][pop[1]] + 1
                    lastIdx = [nx, ny]
                }
            }
        }
    }
}

bfs()
for i in 0..<n {
    for j in 0..<m {
        if box[i][j] == 0 {
            isCooked = false
        }
    }
}

if isCooked {
    print(day[lastIdx[0]][lastIdx[1]])
} else {
    print(-1)
}
