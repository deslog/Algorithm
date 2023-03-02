//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/02.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }

    // bfs
    var queue = [(String, Int)]()
    queue.append((begin, 0))

    while !queue.isEmpty {
        let temp = queue.removeFirst()
        let word = temp.0
        let depth = temp.1

        for w in words {
            if canChange(word: word, changeWord: w) {
                if w == target {
                    return depth + 1
                } else {
                    queue.append((w, depth + 1))
                }
            }
        }
    }

    return 0
}

func canChange(word: String, changeWord: String) -> Bool {
    if zip(word, changeWord).filter({ $0 != $1 }).count == 1 {
        return true
    }
    return false
}

let begin = "hit"
let target = "cog"
//let words = ["hot", "dot", "dog", "lot", "log"]
let words = ["hot", "dot", "dog", "lot", "log", "cog"]
print(solution(begin, target, words))
