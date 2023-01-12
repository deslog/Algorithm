//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/12.
//

import Foundation

// ❌ 시간초과 -> ✅ 통과 (print를 매번 해주는 방식 no, 한번의 출력으로 해결)
// 이 방법 완전 맞는거 같은데 왜 시간초과?
let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0]
let M = NM[1]

var stack = [Int]()
var answer = ""

private func dfs() {
    if stack.count == M {
        answer += stack.map{ String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }

    for i in 1...N {
        stack.append(i)
        dfs()
        stack.removeLast()
    }
}

dfs()
print(answer)

