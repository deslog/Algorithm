//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/16.
//

import Foundation

let n = Int(readLine()!)!
let heightInfo = [-1] + readLine()!.split(separator: " ").map { Int($0)! }
var line = Array(repeating: -1, count: n+1)

for num in 1...n {
    let bigNumCnt = heightInfo[num]
    var cnt = 0
    for j in 1...n {
        if cnt == bigNumCnt {
            if line[j] == -1 {
                line[j] = num
                break
            }
        }

        if line[j] == -1 {
            cnt += 1
        }
    }
}

for i in 1..<line.count {
    print(line[i], terminator: " ")
}
