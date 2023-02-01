//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

import Foundation

let n = Int(readLine()!)!
var meetings = [[Int]]()
for _ in 0..<n {
    meetings.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var meetingCnt = 0
var endTime = 0

meetings.sort{ return $0[0] < $1[0] }
meetings.sort{ return $0[1] < $1[1] }

for meeting in meetings {
    if meetingCnt == 0 || meeting[0] >= endTime {
        endTime = meeting[1]
        meetingCnt += 1
    }
}

print(meetingCnt)
