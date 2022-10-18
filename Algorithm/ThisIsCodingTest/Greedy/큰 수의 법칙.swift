//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/13.
//

// 실전 - 큰 수의 법칙 (p.92)

import Foundation

var nmk = readLine()!.split(separator: " ").map { Int($0)! }
var n = nmk[0]
var m = nmk[1]
var k = nmk[2]
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var count = 0
var result = 0
arr.sort(by: >)

while true {
    if m == 0 { break }

    if count == k {
        result += arr[1]
        count = 0
        m -= 1
    } else {
        result += arr[0]
        count += 1
        m -= 1
    }
}

print(result)
