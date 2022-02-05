//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var nums: [Int] = []
var answer: [Int] = []
var idx = input[1] - 1

for i in 1..<input[0]+1 {
    nums.append(i)
}

while true {
    answer.append(nums.remove(at: idx))
    if nums.isEmpty { break }
    idx = (idx + input[1]-1) % nums.count
}


print("<" + answer.map({String($0)}).joined(separator: ", ") + ">")
