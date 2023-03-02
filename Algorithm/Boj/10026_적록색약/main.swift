//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/28.
//

import Foundation

let n = Int(readLine()!)!
var picture = [[String]]()

for _ in 0..<n {
    picture.append(readLine()!.map{ String($0) })
}

var redGreenDiseaseVisited = Array(repeating: Array(repeating: false, count: n), count: n)
var nonDiseaseVisited = Array(repeating: Array(repeating: false, count: n), count: n)
var answer = [0, 0]

// 상 하 좌 우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

enum type {
    case redGreenDisease
    case nonDisease
}

private func dfs(x: Int, y: Int, type: type) {
    switch type {
    case .redGreenDisease:
        redGreenDiseaseVisited[x][y] = true
        let now = picture[x][y]

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            }

            if now == "G" || now == "R" {
                if picture[nx][ny] == "G" || picture[nx][ny] == "R", !redGreenDiseaseVisited[nx][ny] {
                    dfs(x: nx, y: ny, type: .redGreenDisease)
                }
            } else {
                if picture[nx][ny] == now, !redGreenDiseaseVisited[nx][ny] {
                    dfs(x: nx, y: ny, type: .redGreenDisease)
                }
            }
        }

    default:
        nonDiseaseVisited[x][y] = true
        let now = picture[x][y]

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            }

            if now == picture[nx][ny], !nonDiseaseVisited[nx][ny] {
                dfs(x: nx, y: ny, type: .nonDisease)
            }
        }
    }

}

for i in 0..<n {
    for j in 0..<n {
        if !nonDiseaseVisited[i][j] {
            answer[0] += 1
            dfs(x: i, y: j, type: type.nonDisease)
        }

        if !redGreenDiseaseVisited[i][j] {
            answer[1] += 1
            dfs(x: i, y: j, type: type.redGreenDisease)
        }
    }
}

print("\(answer[0]) \(answer[1])")
