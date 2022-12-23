//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/23.
//

import Foundation

private func solution() -> Int {
    let N = Int(readLine()!)!
    let div = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: <)
    return div[0] * div[N-1]
}

print(solution())
