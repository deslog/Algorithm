//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/03.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]

private func solution(_ n: Int, _ m: Int) {
    if n == 1 {
        print(1)
    } else if n == 2 {
        print(min(4, (m+1)/2))
    } else if m < 7 {
        print(min(4, m))
    } else {
        print(m-2)
    }
}

solution(n, m)
