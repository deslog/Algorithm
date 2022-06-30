//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/06/30.
//

let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var cycle = Array(repeating: false, count: n + 1)
var dist = Array(repeating: 0, count: n + 1)

// 순환선?
func dfs(depth: Int, startIdx: Int, currentIdx: Int) {
    if currentIdx == startIdx && depth >= 2 {
        cycle[currentIdx] = true
        return
    }
    visited[currentIdx] = true
    
    for i in graph[currentIdx] {
        if !visited[i] {
            dfs(depth: depth+1, startIdx: startIdx, currentIdx: i)
        } else { //이미 방문한 역이라면
            if depth >= 2, startIdx == i {
                dfs(depth: depth, startIdx: startIdx, currentIdx: i)
            }
        }
    }
}

// 순환선 아닌애들 dfs돌려서 dist 찾아줘
func bfs(x: Int) -> Int {
    var bfsVisited = Array(repeating: false, count: 3001)
    var queue = [[Int]]()
    queue.append([x, 0])
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        if cycle[pop[0]] {  // 사이클에 포함 -> 사이클에 도달한거임
            return pop[1]
        }
        for i in graph[pop[0]] {
            if !bfsVisited[i] {
                queue.append([i, pop[1] + 1])
                bfsVisited[i] = true
            }
        }
    }
    return 0
}

for _ in 0..<n {
    let a = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[a[0]].append(a[1])
    graph[a[1]].append(a[0])
    graph[a[0]].sort()
    graph[a[1]].sort()
}

// dfs함수 실행
for i in 1...n {
    visited = Array(repeating: false, count: 3001)
    dfs(depth: 0, startIdx: i, currentIdx: i)
}

// cycle 안에있으면 거리 0 아니면 bfs적용
for i in 1...n {
    if !cycle[i] {
        dist[i] = bfs(x: i)
    } else {
        dist[i] = 0
    }
}

dist.removeFirst()
print(dist.map{ String($0) }.joined(separator: " "))
