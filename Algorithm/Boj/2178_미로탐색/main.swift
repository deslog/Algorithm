//
//  File.swift
//  Algorithm
//
//  Created by 이지수 on 2022/06/23.
//

var nm = readLine()!.split(separator: " ").map { Int(String($0))! }

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0] // 상하좌우

var arr = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])
var distance = Array(repeating: Array(repeating: 0, count: nm[1]), count: nm[0])

for _ in 0..<nm[0] {
    var temp = Array(readLine()!).map { Int(String($0))! }
    arr.append(temp)
}

func bfs() {
    distance[0][0] = 1
    visited[0][0] = true
    
    var queue: [[Int]] = [[0,0]]
    
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        
        let x = pop[0]
        let y = pop[1]
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && nx < nm[0] && ny >= 0 && ny < nm[1] {
                if !visited[nx][ny] && arr[nx][ny] == 1 {
                    distance[nx][ny] = distance[x][y] + 1
                    
                    visited[nx][ny] = true
                    queue.append([nx, ny])
                }
            }
        }
    }
}

bfs()
print(distance[nm[0]-1][nm[1]-1])
