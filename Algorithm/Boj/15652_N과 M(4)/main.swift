//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/12.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0]
let M = NM[1]

var stack = [Int]()
var answer = ""

private func dfs(start: Int) {
    if stack.count == M {
        answer += stack.map{ String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }

    for i in start..<N+1 {
        stack.append(i)
        dfs(start: i)
        stack.removeLast()
    }
}

dfs(start: 1)
print(answer)
