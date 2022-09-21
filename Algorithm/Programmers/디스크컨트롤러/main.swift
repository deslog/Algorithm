//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/09/21.
//

import Foundation

var jobs = [[0, 3], [1, 9], [2, 6]]
// return 9

func solution(_ jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted(by: { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] })
    sortedJobs.sort(by: { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] })
    var now = 0
    var totalTime = 0

    while !sortedJobs.isEmpty {
        var check = false
        for i in 0..<sortedJobs.count {
            if sortedJobs[i][0] <= now {
                now += sortedJobs[i][1]
                totalTime += now - sortedJobs[i][0]
                sortedJobs.remove(at: i)
                check = true
                break
            }
        }
        // for문안에다가 넣어서 시간 한참걸렸네 ㅠㅠ 
        if !check {
            now += 1
        }
    }

    return totalTime / jobs.count
}

print(solution(jobs))
