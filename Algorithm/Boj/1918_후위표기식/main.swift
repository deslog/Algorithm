//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/12.
//

import Foundation

var line = readLine()!
var answer: [String] = []
var stack: [String] = []

func getPriority(ch: Character) -> Int{
    switch ch {
    case "+":
        return 1
    case "-":
        return 1
    case "*":
        return 2
    case "/":
        return 2
    case "(":
        return 0
    default:
        break
    }
    return 0
}

