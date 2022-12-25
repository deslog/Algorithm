//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/25.
//

import Foundation

private func solution() {
    var nm = readLine()!.split(separator: " ").map { Int($0)! }
    let gcd = gcd(nm[0], nm[1])
    let lcd = (nm[0] * nm[1]) / gcd
    print(gcd)
    print(lcd)
}

private func gcd(_ n: Int, _ m: Int) -> Int {
    return m == 0 ? n : gcd(m, n%m)
}

solution()
