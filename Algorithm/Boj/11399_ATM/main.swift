//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/04/25.
//

import Foundation

// 그리디인 이유: 대기시간이 최소가 되도록 해야하니까 최소시간을 걸리는 애들먼저 더해줌
func solution() {
    let n = Int(readLine()!)!
    var line = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
    var answer = 0

    for i in 0..<n {
        answer += line[0...i].reduce(0, +)
    }

    print(answer)
}

solution()
