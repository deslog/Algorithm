//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/19.
//

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for i in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var visited = Array(repeating: false, count: n)
var result = Array(repeating: Array(repeating: 0, count: n), count: n)

func dfs(start: Int, now: Int) {
    for i in 0..<n {
        if graph[now][i] == 1 && !visited[i] {
            result[start][i] = 1
            visited[i] = true
            dfs(start: start, now: i)
        }
    }
}

for i in 0..<n {
    dfs(start: i, now: i)
    visited = Array(repeating: false, count: n)
}

for j in result {
    for r in j {
        print(r, terminator: " ")
    }
    print()
}
