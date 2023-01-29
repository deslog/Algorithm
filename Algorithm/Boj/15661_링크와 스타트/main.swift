//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/28.
//

import Foundation

let n = Int(readLine()!)!
var s = [[Int]]()
for _ in 0..<n {
    s.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var visited = Array(repeating: false, count: n)
var minResult = 99999

private func dfs(depth: Int, team: Int, total: Int) {
    if depth == n { // 트리의 깊이가 n이라는것은, n번 다봤다는 뜻
        return
    }

    if team == total {
        var teamStart = 0
        var teamLink = 0

        for i in 0..<n {
            for j in 0..<n {
                if visited[i], visited[j] {
                    teamStart += s[i][j]
                }
                if !visited[i], !visited[j] {
                    teamLink += s[i][j]
                }
            }
        }
        minResult = min(minResult, abs(teamLink - teamStart))
        return
    }

    visited[depth] = true
    dfs(depth: depth + 1, team: team + 1, total: total)
    visited[depth] = false
    dfs(depth: depth + 1, team: team, total: total)
}

for k in 1..<n/2+2 {
    // true인 팀이 1개일때부터 n/2개일때까지 비교
    dfs(depth: 0, team: 0, total: k)
}

print(minResult)
