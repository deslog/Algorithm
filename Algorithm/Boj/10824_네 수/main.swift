//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/18.
//

let line = readLine()!.split(separator: " ").map{ String($0) }
var answer1 = ""
var answer2 = ""

for i in 0..<line.count {
    if i == 0 || i == 1 {
        answer1 += line[i]
    }else {
        answer2 += line[i]
    }
}

print(Int(answer1)! + Int(answer2)!)
