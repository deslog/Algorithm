//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/18.
//

import Foundation

var lc = readLine()!.split(separator: " ").map{ Int($0)! }
var l = lc[0]
var c = lc[1]
var aeiou = ["a", "e", "i", "o", "u"]
var arr = readLine()!.split(separator: " ").map{ String($0) }.sorted(by: <)
var visited = Array(repeating: false, count: c)
var password = [String]()

private func dfs(index: Int) {
    // 최소 모음 한개 이상, 최소 자음 두개 이상
    if password.count == l {
        var containAeiou = false
        var consonantCnt = 0

        for i in password {
            if aeiou.contains(i) {
                containAeiou = true
            } else {
                consonantCnt += 1
            }
        }

        if consonantCnt >= 2, containAeiou {
            print(password.joined(separator: ""))
        }
        return
    }

    for k in index..<c {
        if !visited[k] {
            visited[k] = true
            password.append(arr[k])
            dfs(index: k)
            visited[k] = false
            password.removeLast()
        }
    }
}

dfs(index: 0)
