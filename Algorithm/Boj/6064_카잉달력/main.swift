//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/01.
//

import Foundation

//// ❌ 첫번째 풀이 (틀렸습니다) -> 예외 찾아보자.. 뭘까?
//// year의 최대값을 다시 구해보자.
//// maxYear을 최소공배수로 구해줬다. -> ❌ 시간초과
//var n = Int(readLine()!)!
//
//for _ in 0..<n {
//    let mnxy = readLine()!.split(separator: " ").map{ Int($0)! }
//    var year = 1
//    let gcd = mnxy[0] > mnxy[1] ? gcd(mnxy[0], mnxy[1]) : gcd(mnxy[1], mnxy[0])
//    let maxYear = (mnxy[0] * mnxy[1]) / gcd
//
//    while true {
//        if (year - mnxy[2]) % mnxy[0] == 0, (year - mnxy[3]) % mnxy[1] == 0 {
//            print(year)
//            break
//        }
//        if year == maxYear {
//            print(-1)
//            break
//        }
//        year += 1
//    }
//}
//
//private func gcd(_ n: Int, _ m: Int) -> Int {
//    return m == 0 ? n : gcd(m, n%m)
//}

// ✅ 세번재 시도

var n = Int(readLine()!)!

for _ in 0..<n {
    let mnxy = readLine()!.split(separator: " ").map{ Int($0)! }
    let gcd = mnxy[0] > mnxy[1] ? gcd(mnxy[0], mnxy[1]) : gcd(mnxy[1], mnxy[0])
    let maxYear = (mnxy[0] * mnxy[1]) / gcd
    var isinCal = false

    for i in 0..<maxYear / mnxy[0] {
        let year = i * mnxy[0] + mnxy[2]
        let y = year % mnxy[1] == 0 ? mnxy[1] : year % mnxy[1]

        if y == mnxy[3] {
            print(year)
            isinCal = true
            break
        }
    }

    if !isinCal {
        print(-1)
    }
}

private func gcd(_ n: Int, _ m: Int) -> Int {
    return m == 0 ? n : gcd(m, n%m)
}
