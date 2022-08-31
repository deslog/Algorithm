//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/31.
//

import Foundation

// input
let n = Int(readLine()!)!
var meeting = [[Int]]()
for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    meeting.append(temp)
}

// main
func solution(_ meeting: [[Int]]) -> Int {
    // meeting 오름차순으로 정렬
    var sortedMeetings = meeting
    sortedMeetings.sort{ return $0[0] < $1[0] }
    sortedMeetings.sort{ return $0[1] < $1[1] }

    var cnt = 0
    var prevEndTime = 0

    for meeting in sortedMeetings {
        let start = meeting[0]
        let end = meeting[1]

        if start >= prevEndTime {
            cnt += 1
            prevEndTime = end
        }
    }
    return cnt
}

print(solution(meeting))

// 시간초과
// 시간제한이 2초 -> 아무래도 이중 for문을 쓴게 문제가 되는 것 같음
// 최대값이 2^31이므로, 이중 for문을 돌경우 2^31 * 2^31 이 되니까 어마어마하게 큰 연산이 들어가게 됩니당.
//func solution(_ meeting: [[Int]]) -> Int {
//
//    var cnt = Array(repeating: 0, count: n)
//    // meeting 오름차순으로 정렬
//    var sortedMeetings = meeting
//    sortedMeetings.sort{ return $0[0] < $1[0] }
//    sortedMeetings.sort{ return $0[1] < $1[1] }
//
//    for i in 0..<n {
//        cnt[i] += 1
//        var endTime = sortedMeetings[i][1]
//
//        for j in i+1..<n {
//            if sortedMeetings[j][0] >= endTime {
//                cnt[i] += 1
//                endTime = sortedMeetings[j][1]
//            }
//        }
//    }
//
//    return cnt.max()!
//}
//
