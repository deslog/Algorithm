//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/24.
//

import Foundation

let tickets = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
// return : ["ICN", "JFK", "HND", "IAD"]

func solution(_ tickets:[[String]]) -> [String] {
    var answer = [String]()
    var visited = Array(repeating: false, count: tickets.count)
    let tickets = tickets.sorted{ $0[1] < $1[1] }

    // MARK: - DFS 함수
    func dfs(airport: String) {
        // 만약 모든 티켓이 다 사용되고 마지막 end 지점이라면?
        if tickets.count == answer.count {
            answer.append(airport)
            return
        }

        for i in 0..<tickets.count {
            let start = tickets[i][0]
            let end = tickets[i][1]

            if airport == start, !visited[i] {
                visited[i] = true
                answer.append(start)
                dfs(airport: end)
                if tickets.count + 1 == answer.count {
                    return
                }
                visited[i] = false
                answer.removeLast()
            }
        }
    }

    dfs(airport: "ICN")

    return answer
}

print(solution(tickets))
