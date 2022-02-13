//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/13.
//

import Foundation

var array = [Int](repeating: 0, count: 26)
let line = readLine()!

for ch in line {
    array[Int(ch.asciiValue!)-97] += 1
}

print(array.map{ "\($0)" }.joined(separator: " "))
