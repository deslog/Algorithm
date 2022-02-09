//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/09.
//

import Foundation

let line = readLine()!.map{String($0)}
var stack = 0
var count = 0

for i in 0..<line.count {
    if line[i] == "(" {
        stack += 1
    } else {
        stack -= 1
        if line[i-1] == "(" {
            count += stack
        } else {
            count += 1
        }
    }
}

print(count)
