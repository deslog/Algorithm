//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/22.
//

import Foundation

func solution(_ n: Int, _ k: Int) -> Int {
    let changeN = changeFormat(n: n, k: k)
    var count = 0

    for char in changeN {
        if char == 0 {
            continue
        }
        if char == 1 {
            continue
        }
        if isPrime(n: char) {
            count += 1
        }
    }
    return count
}

func isPrime(n: Int) -> Bool {
    if(n<4) {
        return n == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(n))) {
        if(n % i == 0) { return false }
    }
    return true
}

func changeFormat(n: Int, k: Int) -> [Int] {
    let split = String(n, radix: k).split(separator: "0").map { Int($0)! }
    return split
}
