//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/26.
//

import Foundation

func solution(_ p:String) -> String {

    var newp = p.map { String($0) }
    var answer = ""
    var u = ""
    var v = ""

    // 조건 1: 만약 빈 문자열일 경우, 빈 문자열을 반환
    if newp.count == 0 || isCorrect(newp) {
        let result = newp.joined(separator: "")
        return result
    }

    // 조건2: uv분리, u == isBalance 여야함 -> 될때까지 u,v 로 나누기
    for i in stride(from: 0, to: newp.count-1, by: 2) {
        u += newp[i]
        u += newp[i+1]

        if i+1 != newp.count {
            for j in i+1..<newp.count+1 {
                v += newp[j]
            }
        }

        if isBalance(u) {
            break
        }
    }

    return ""
}

func isBalance(_ string: String) -> Bool {
    return string.components(separatedBy: "(").count == string.components(separatedBy: ")").count
}

func isCorrect(_ str: [String]) -> Bool {
    let n = str.count
    var left = [String]()

    if str[0] == ")" {
        return false
    } else {
        left.append(String(str[0]))
    }

    for i in 1..<n {
        if left.count == 0 || left[left.endIndex-1] == ")" {
            left.append(String(str[i]))
        } else if left[left.endIndex-1] == "(", str[i] == "(" {
            left.append(String(str[i]))
        } else {
            left.remove(at: 0)
        }
    }

    if left.count == 0 {
        return true
    } else {
        return false
    }
}

