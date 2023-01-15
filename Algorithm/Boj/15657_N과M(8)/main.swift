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

var stack = [String]()
var answer = ""

private func dfs(start: Int) {
    if stack.count == m {
        answer += stack.joined(separator: " ") + "\n"
        return
    }

    for i in start..<n {
        stack.append(String(arr[i]))
        dfs(start: i)
        stack.removeLast()
    }
}

dfs(start: 0)
print(answer)
