//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/08.
//

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let sortedCosts = costs.sorted{ $0[2] < $1[2] }
    var parentIdx = (0..<n).map{ $0 }
    var answer = 0

    for cost in sortedCosts {
        if !isCycle(parentArr: parentIdx, left: cost[0], right: cost[1]) {
            // 사이클 형성 안되면, 부모 바꿔주고
            // 작은 node 번호를 가진 애의 부모 번호를 갖게 된다.
            var newParent = 0
            var oldParent = 0

            if cost[0] > cost[1] {
                newParent = parentIdx[cost[1]]
                oldParent = parentIdx[cost[0]]
            } else {
                newParent = parentIdx[cost[0]]
                oldParent = parentIdx[cost[1]]
            }
            // left right 뿐만 아니라 다른 연결된 애들도 모조리 찾아서 바꿔줘야해
            parentIdx.indices.filter{ parentIdx[$0] == oldParent }.forEach{ parentIdx[$0] = newParent }
            // 다리 건설 햇으니까 cost 더해주기
            answer += cost[2]
        }
    }
    return answer
}

private func isCycle(parentArr: [Int], left: Int, right: Int) -> Bool {
    // 양쪽 부모가 같은지 확인
    return parentArr[left] == parentArr[right] ? true : false
}

print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
