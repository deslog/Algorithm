//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/16.
//

import Foundation

let hw = readLine()!.split(separator: " ").map{ Int($0)! }
let h = hw[0]
let w = hw[1]

let block = readLine()!.split(separator: " ").map{ Int($0)! }
var now = 0
var leftrightMin = 100000
var answer = 0

for i in 1..<w-1 {
    now = block[i]
    var leftMax = -9999
    var rightMax = -9999

    for l in 0..<i {
        leftMax = max(leftMax, block[l])
    }

    for r in i+1..<w {
        rightMax = max(rightMax, block[r])
    }

    leftrightMin = min(leftMax, rightMax)
    if leftrightMin - now > 0 {
        answer += leftrightMin - now
    }
}

print(answer)
