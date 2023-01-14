//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

var stack = [Int]()
var answer = ""

private func dfs(start: Int) {
    if stack.count == m {
        answer += stack.map{ String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }

    for i in start..<n {
        if !stack.contains(arr[i]) {
            stack.append(arr[i])
            dfs(start: i+1)
            stack.removeLast()
        }
    }
}

dfs(start: 0)
print(answer)
