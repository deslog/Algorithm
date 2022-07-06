//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/06.
//

import Foundation

let nlr = readLine()!.split(separator: " ").map { Int(String($0))! }
var ground = [[Int]]()
let n = nlr[0]
let l = nlr[1]
let r = nlr[2]
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1] // 상하좌우
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
for _ in 0..<n {
    ground.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func dfs(_ i: Int, _ j: Int) -> Int {
    var queue = [(Int, Int)]()
    queue.append((i, j))
    visited[i][j] = true  // 방문처리
    var union = [(Int, Int)]()  // 연합국가 초기화하고, 다시 넣어주는 과정
    union.append((i, j))
    var count = 0  // 연합국가의 인구수를 더해주는 변수
    count += ground[i][j]
    
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        let x = xy.0
        let y = xy.1
        
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n {
                continue
            }
            
            if visited[nx][ny] {
                continue
            }
            
            // 조건 충족하면 union 에 넣어주어서 수 세어주기
            if l <= abs(ground[nx][ny] - ground[x][y]), abs(ground[nx][ny] - ground[x][y]) <= r {
                union.append((nx, ny))
                visited[nx][ny] = true
                count += ground[nx][ny]
                queue.append((nx, ny))
            }
        }
    }
    // 연합국가들의 인구 수
    let unionPopulation = Int(floor(Double(count) / Double(union.count)))
    for country in union {
        ground[country.0][country.1] = unionPopulation
    }
    
    return union.count
}

// 2. 연합국가가 2개 이상이면 bfs 통해서 계속 인구이동을 확인해야함
var day = 0
while true {
    visited = Array(repeating: Array(repeating: false, count: n), count: n) // visited 초기화
    var check = false // 인구 이동 존재 유무 체크
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                if dfs(i, j) >= 2 {
                    check = true
                }
            }
        }
    }
    
    if !check { // 더이상 union 의 개수가 없는 경우 check가 false 임
        break
    }
    
    day += 1
}

print(day)
