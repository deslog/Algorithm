//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/20.
//

import Foundation

//let tickets = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
let tickets = [["ICN", "A"], ["A", "B"], ["A", "C"], ["C", "A"], ["B", "D"]]
// 결과  ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]

func solution(_ tickets:[[String]]) -> [String] {
    var result = [String]()
    var visited = Array(repeating: false, count: tickets.count)
    var tickets = tickets.sorted { $0[1] < $1[1] }

    func dfs(_ check: String) {
        if result.count == tickets.count {
            result.append(check)
            return
        }

        for i in 0..<tickets.count {
            let start = tickets[i][0]
            let end = tickets[i][1]

            // start랑 같은지 확인하고, 아직 방문하지 않은 티켓이면
            if check == start, !visited[i] {
                visited[i] = true
                result.append(start)
                dfs(end) // 다시 end를 dfs돌려서 check

                // dfs 재귀로 돌고나서 티켓을 빠짐없이 다 사용했다면 종료
                if result.count == tickets.count + 1 {
                    return
                }
                print(result)
                result.removeLast()
                print(result)
                print("_____________________")
                visited[i] = false
            }
        }
    }
    dfs("ICN")

    return result
}

print(solution(tickets))
