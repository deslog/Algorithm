//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/23.
//

import Foundation

//private func solution() -> Int {
//    let N = Int(readLine()!)!
//    var sum = 0
//
//    for i in 1..<N+1 {
//        var div = [Int]()
//        for j in 1..<i+1 {
//            if i == j {
//                div.append(i)
//                break
//            }
//            if i % j == 0 {
//                div.append(j)
//            }
//        }
//        for d in div {
//            sum += d
//        }
//    }
//    return sum
//}
//
//print(solution())

private func solution() -> Int {
    let N = Int(readLine()!)!
    var sum = 0
    
    for i in 1..<N+1 {
        sum += (N / i) * i
    }

    return sum
}

print(solution())
