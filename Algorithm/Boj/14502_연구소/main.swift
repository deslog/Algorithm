//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/14.
//

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0] // 세로
let m = nm[1] // 가로
var lab = [[Int]]()
var empty = [(Int, Int)]()
var virus = [(Int, Int)]()
var max = 0
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for _ in 0..<n {
    lab.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for y in 0..<n {
    for x in 0..<m {
        if lab[y][x] == 0 {
            empty.append((y, x))
        } else if lab[y][x] == 2 {
            virus.append((y, x))
        }
    }
}

// bfs
// 바이러스를 전파시키면서 bfs돌려줌
func bfs(copyLab: Array<Array<Int>>) {
    var bfsLab = copyLab // lab을 바꿔버리면 안되기 때문에 마지막에 bfs돌릴 때 copy 해서 돌릴 거임
    var queue = [(Int, Int)]()
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var cnt = 0
    
    for i in 0..<virus.count {
        queue.append(virus[i])
    }

    while !queue.isEmpty {
        let yx = queue.removeFirst()
        let y = yx.0
        let x = yx.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            // 범위 확인하고, 0 이면 2로 바꾸면서 바이러스 전파시킴, 그리고 방문처리
            if nx >= 0, ny >= 0, nx < m, ny < n {
                if bfsLab[ny][nx] == 0, visited[ny][nx] == false {
                    queue.append((ny, nx))
                    visited[ny][nx] = true
                    bfsLab[ny][nx] = 2
                }
            }
        }
    }
    
    // 0 세어주기
    for i in 0..<n {
        cnt += bfsLab[i].filter { ($0) == 0 }.count
    }
    
    // max 값 갱신해주기
    if max < cnt {
        max = cnt
    }
}

// 전체 돌면서 1 넣어주기
for i in 0..<empty.count {
    for j in 0..<i {
        for k in 0..<j {
            let y1 = empty[i].0
            let x1 = empty[i].1
            let y2 = empty[j].0
            let x2 = empty[j].1
            let y3 = empty[k].0
            let x3 = empty[k].1
            
            lab[y1][x1] = 1
            lab[y2][x2] = 1
            lab[y3][x3] = 1
            
            let newLab = lab
            bfs(copyLab: newLab)
            
            lab[y1][x1] = 0
            lab[y2][x2] = 0
            lab[y3][x3] = 0
        }
    }
}

print(max)
