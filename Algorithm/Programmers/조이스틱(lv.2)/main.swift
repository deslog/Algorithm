//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/02.
//

import Foundation

func solution(_ name:String) -> Int {
    let nameArr = name.map{ String($0) }
    var count = 0
    var idx = 0
    var cursor = nameArr.count - 1

    // A를 다른 알파벳으롭 바꾸는데 얼마나 걸리는지
    for char in nameArr {
        if char != "A" {
            let now = Int(UnicodeScalar(char)!.value)
            count += min(now-65, 91-now)
        }
    }

    if count == 0 {
        return count
    }

    // 커서전환
    for i in 0..<nameArr.count {
        idx = i + 1
        while idx < nameArr.count, nameArr[idx] == "A" {
            idx += 1
        }

        cursor = min(cursor, i * 2 + nameArr.count - idx, (nameArr.count - idx) * 2 + i)
    }

    return name.count == 1 ? count : count + cursor
}

let name = "AAAABABAAAAA"
print(solution(name))
