//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/14.
//

import Foundation

// ❌ 시간초과 -> 중간에 있는 고차함수 map 때문인것 같다.
//let nm = readLine()!.split(separator: " ").map{ Int($0)! }
//let n = nm[0]
//let m = nm[1]
//let arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
//
//var stack = [Int]()
//var answer = ""
//
//private func dfs() {
//    if stack.count == m {
//        answer += stack.map{ String($0) }.joined(separator: " ")
//        answer += "\n"
//        return
//    }
//
//    for i in 0..<n {
//        stack.append(arr[i])
//        dfs()
//        stack.removeLast()
//    }
//}
//
//dfs()
//print(answer)

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

var stack = [String]()
var answer = ""

private func dfs() {
    if stack.count == m {
        answer += stack.joined(separator: " ") + "\n"
        return
    }

    for i in 0..<n {
        stack.append(String(arr[i]))
        dfs()
        stack.removeLast()
    }
}

dfs()
print(answer)
