//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/18.
//

import Foundation

//let n = readLine()!.split(separator: " ").map { Int($0)! }
//
//func solution(_ n: [Int]) -> [Int] {
//    var answer = [Int]()
//    for i in 0..<n.count {
//        var one = 0
//
//        while true {
//            one = one * 10 + 1
//
//            if one % n[i] == 0 {
//                break
//            }
//        }
//        answer.append(String(one).count)
//    }
//    return answer
//}
//
//var answer = solution(n)
//for i in 0..<answer.count {
//    print(answer[i], terminator: "\n")
//}

while let n = readLine() {
    let n = Int(n)!
    var one = 1
    var count = 0

    while true {
        count += 1
        if one % n == 0 {
            print(count)
            break
        } else {
            one = ((one * 10) + 1) % n
        }
    }
}
