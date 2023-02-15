//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/15.
//

import Foundation

let switchNum = Int(readLine()!)!
var switches = [-1] + readLine()!.split(separator: " ").map { Int($0)! }
let studentNum = Int(readLine()!)!
var students = [[Int]]()
for _ in 0..<studentNum {
    students.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for student in students {
    switch student[0] {
    case 1:
        let num = student[1]
        for i in stride(from: num, through: switchNum, by: num) {
            switches[i] = switches[i] == 1 ? 0 : 1
        }
    default:
        let num = student[1]
        switches[num] = switches[num] == 1 ? 0 : 1
        for i in 1...switchNum/2 {
            if num - i < 1 || num + i > switchNum {
                break
            }
            if switches[num - i] == switches[num + i] {
                switches[num - i] = switches[num - i] == 1 ? 0 : 1
                switches[num + i] = switches[num + i] == 1 ? 0 : 1
            } else {
                break
            }
        }
    }
}

for i in 1...switchNum {
    print(switches[i], terminator: " ")
    if i % 20 == 0 {
        print()
    }
}
