//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/05.
//

import Foundation

let N = Int(readLine()!)!
var i = 1
var answer = 0

while i <= N {
    answer += (N-i) + 1
    i *= 10
}

print(answer)
