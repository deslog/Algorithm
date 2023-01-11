//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/11.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0]
let M = NM[1]

var stack = [Int]()

private func dfs(start: Int) {
    if stack.count == M {
        print(stack.map{ String($0) }.joined(separator:" "))
        return
    }

    for i in start..<N+1 {
        if !stack.contains(i) {
            stack.append(i)
            dfs(start: i+1)
            stack.removeLast()
        }
    }
}

dfs(start: 1)
