//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/18.
//

// 유형별 풀이 - 그리디 - 모험가 길드 (p.311)

import Foundation

let n = Int(readLine()!)!
let horror = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

var teamMember = 0
var groupNum = 0

for h in horror {
    teamMember += 1

    // 팀멤버의 수가 공포도h보다 높으면 팀 결성
    if teamMember >= h {
        groupNum += 1
        // team이 결성됐으니까 다시 0부터 시작
        teamMember = 0
    }
}

print(groupNum)
