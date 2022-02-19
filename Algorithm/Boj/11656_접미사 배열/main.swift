//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/18.
//

let line = Array(readLine()!)
var answer: [String] = []

for i in 0..<line.count {
    var word = ""
    for j in i..<line.count {
        word += String(line[j])
    }
    answer.append(word)
}
answer = answer.sorted()

for a in answer {
    print(a)
}
