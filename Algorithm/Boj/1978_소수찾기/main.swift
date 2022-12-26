//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/26.
//

import Foundation

//private func solution() -> Int {
//    let n = Int(readLine()!)!
//    let arr = readLine()!.split(separator: " ").map { Int($0)! }
//    var answer = [Int]()
//
//    for i in arr {
//        var flag = true
//        if i == 1 {
//            continue
//        }
//        for j in 2..<i {
//            if i % j == 0 {
//                flag = false
//            }
//        }
//        if flag {
//            answer.append(i)
//        }
//    }
//
//    return answer.count
//}
//
//print(solution())

// sqrt로 시간복잡도 줄여보기
//private func solution() -> Int {
//    let n = Int(readLine()!)!
//    let arr = readLine()!.split(separator: " ").map { Int($0)! }
//    var answer = [Int]()
//
//    for i in arr {
//        var flag = true
//        if i == 1 {
//            continue
//        }
//        for j in 2..<Int(sqrt(Double(i)))+1 {
//            if i % j == 0 {
//                flag = false
//            }
//        }
//        if flag {
//            answer.append(i)
//        }
//    }
//
//    return answer.count
//}
//
//print(solution())

// 에라토스테네스의 체 이용하기

private func solution() -> Int {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = [Int]()
    var visited = Array(repeating: false, count: 1001)
    visited[0] = true
    visited[1] = true
    // 1000까지 미리 소수 판별
    for i in 2...1000 {
        if visited[i] == true {
            continue
        }

        for j in stride(from: i+i, through: 1000, by: i) {
            visited[j] = true
        }
    }

    // flase 이면 출력
    for k in arr {
        if visited[k] == false {
            answer.append(k)
        }
    }

    return answer.count
}

print(solution())
