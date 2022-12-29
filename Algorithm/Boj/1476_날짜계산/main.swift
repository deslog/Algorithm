//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/29.
//

import Foundation

// ❌ 실패코드 -> 어디서 틀렸는지 예외 케이스가 생각이 안나ㅠㅠ
//private func solution() -> Int {
//    // 나올 수 있는 가장 작은 수니까, 최고로 크게 나올 수 있는 수는 7980
//
//    let esm = readLine()!.split(separator: " ").map { Int($0)! }
//    for i in 1...7980 {
//        if i % 15 == esm[0] || i % 15 == 0 {
//            if i % 28 == esm[1] || i % 28 == 0 {
//                if i % 19 == esm[2] || i % 19 == 0 {
//                    return i
//                }
//            }
//        }
//    }
//
//    return 0
//}
//
//print(solution())

// ✅ 두번째 시도, 다른 방법으로,,,

private func solution() {
    let esm = readLine()!.split(separator: " ").map { Int($0)! }
    var year = 1

    while true {
        if (year - esm[0]) % 15 == 0, (year - esm[1]) % 28 == 0, (year - esm[2]) % 19 == 0 {
            print(year)
            break
        }
        year += 1
    }
}

solution()
