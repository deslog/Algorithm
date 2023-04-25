//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/04/25.
//

import Foundation

func solution() {
    let input = readLine()!
    var minus = input.split(separator: "-").map{ String($0) }

    for i in 0..<minus.count {
        if minus[i].contains("+") {
            let temp = minus[i].split(separator: "+").map{ Int($0)! }
            minus[i] = String(temp.reduce(0, +))
        }
    }

    var answer = minus.map{ Int($0)! }.reduce(0, -)
    print(answer + 2 * Int(minus[0])!)
}

solution()
