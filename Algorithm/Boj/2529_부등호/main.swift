////
////  main.swift
////  Algorithm
////
////  Created by LeeJiSoo on 2023/01/29.
////
//
import Foundation

let n = Int(readLine()!)!
let inequality = readLine()!.split(separator: " ").map{ String($0) }
var answer = ""
var answerList = [String]()
var visited = Array(repeating: false, count: 10)

private func check(num1: Int, num2: Int, inequal: String) -> Bool {
    if inequal == "<" {
        if num1 < num2 {
            return true
        } else {
            return false
        }
    } else {
        if num1 > num2 {
            return true
        } else {
            return false
        }
    }
}

private func dfs(answer: String) {
    if answer.count == n+1 {
        answerList.append(answer)
        return
    }

    for i in stride(from: 9, through: 0, by: -1) {
        if !visited[i] {
            if answer == "" || check(num1: Int(String(Array(answer)[answer.count-1]))!,
                                     num2: i,
                                     inequal: inequality[answer.count-1]) {
                visited[i] = true
                dfs(answer: answer + String(i))
                visited[i] = false
            }
        }
    }

}

dfs(answer: answer)

for i in 0..<2 {
    if i == 0 {
        print(answerList[i])
    } else {
        print(answerList[answerList.count-1])
    }
}
