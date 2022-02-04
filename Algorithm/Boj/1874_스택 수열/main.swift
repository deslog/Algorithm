//
//  1874_스택 수열.swift
//  Boj Algorithm
//
//  Created by 이지수 on 2022/02/03.
//


//push : + , pop : -, 불가능한 경우 : NO
//처음 수 n , 이후 n 번 입력 받음

import Foundation

let n = Int(readLine()!)!

var count = 1
var stack: [Int] = []
var answer: [String] = []


for _ in 0..<n {
    
    let num = Int(readLine()!)!
    
    while count <= num {
        stack.append(count)
        answer.append("+")
        count += 1
    }
    
    if stack.last == num {
        stack.popLast()
        answer.append("-")
    } else {
        print("NO")
        exit(0)
    }
    
}

print(answer.joined(separator: "\n"))
