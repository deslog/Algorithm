//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2023/04/22
//

import Foundation

// ------------------------- BFS -------------------------
func bfs() {
    let nk = readLine()!.split(separator: " ").map{ Int($0)! }
    var queue = [(nk[0], 0)] // 수빈이의 첫 위치가 시작점, depth 는 0
    var visited = Array(repeating: false, count: 100001)
    visited[nk[0]] = true
    var idx = 0

    while idx <= queue.count {
        let temp = queue[idx]
        let place = temp.0
        let depth = temp.1

        if place == nk[1] { // k위치면?
            print("\(depth)")
            break
        }

        for i in 0..<3 {
            var nextPlace = 0

            switch i {
            case 0:
                nextPlace = place - 1
            case 1:
                nextPlace = place + 1
            default:
                nextPlace = place * 2
            }

            if nextPlace >= 0, nextPlace <= 100000, !visited[nextPlace] {
                visited[nextPlace] = true
                queue.append((nextPlace, depth + 1))
            }
        }

        idx += 1
    }
}

bfs()

// ------------------------- dp -------------------------

func dp() -> Int {
    let nk = readLine()!.split(separator: " ").map{ Int($0)! }
    var dp = Array(repeating: 100001, count: 100001) // 최대값아무거나로 채워줌

    if nk[0] >= nk[1] {
        return nk[0] - nk[1]
    }

    for i in 0..<nk[0] {
        dp[i] = nk[0] - i
    }

    dp[nk[0]] = 0

    for i in nk[0]+1...nk[1] {
        if i % 2 == 0 {
            // 짝수이면
            dp[i] = min(dp[i/2] + 1, dp[i-1] + 1)
        } else {
            // 홀수이면
            dp[i] = min(dp[i-1] + 1, dp[(i+1)/2] + 2)
        }
    }

    return dp[nk[1]]
}

print(dp())
