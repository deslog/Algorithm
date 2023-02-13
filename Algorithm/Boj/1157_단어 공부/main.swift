//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/13.
//

import Foundation

let word = readLine()!.map{ $0.uppercased() }

// A: 97 , Z: 122
private func solution(_ word: [String]) -> String {
    var alpahbet = Array(repeating: 0, count: 122)

    for char in word {
        alpahbet[Int(UnicodeScalar(char)!.value)] += 1
    }

    let maxNum = alpahbet.max()!
    if alpahbet.filter({ $0 == maxNum }).count > 1 {
        return "?"
    }
    return String(UnicodeScalar(alpahbet.firstIndex(of: maxNum)!)!)
}

print(solution(word))
