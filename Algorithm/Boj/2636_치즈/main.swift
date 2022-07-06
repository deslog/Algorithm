//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/06.
//

// ref: https://hooongs.tistory.com/264

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var cheeseCnt = [Int]()
var cheeseBoard = [[Int]]()
var time = 0
var cnt = 0

for _ in 0..<n {
    cheeseBoard.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

func bfs() -> Int {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n) // bfs돌떄마다 0,0부터 시작하니까 visited 도 초기화
    var queue = [(Int, Int)]() // bfs돌 queue 초기화
    queue.append((0, 0))
    visited[0][0] = true
    cnt = 0  // 한번 돌 때 몇개의 치즈가 사라지는지 count -> 나중에 cheesecnt에 넣어줄거임
    
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        let x = xy.0
        let y = xy.1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0, nx < n, ny >= 0, ny < m, !visited[nx][ny] {
                if cheeseBoard[nx][ny] == 0 {  // 공기자리 일 때
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                } else if cheeseBoard[nx][ny] == 1 { // 치즈가 있는 위치일 때
                    visited[nx][ny] = true
                    cheeseBoard[nx][ny] = 0
                    cnt += 1
                }
            }
        }
    }
    cheeseCnt.append(cnt)
    return cnt
}

while true {
    time += 1
    cnt = bfs()
    if cnt == 0 { // 더이상 녹을 치즈가 없다는 뜻
        break
    }
}

print(time-1)
print(cheeseCnt[cheeseCnt.count-2])
