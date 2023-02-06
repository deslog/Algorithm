//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/06.
//

import Foundation

private func solution(_ input: String) -> Int {
    let input = input.split(separator: "-").map{ $0 }
    var minusArr = [Int]()

    for i in 0..<input.count {
        if !input[i].contains("+") {
            minusArr.append(Int(input[i])!)
            continue
        }

        let temp = input[i].split(separator: "+").map{ Int($0)! }.reduce(0,+)
        minusArr.append(temp)
    }

    if minusArr.count > 1 {
        var total = minusArr[0]
        for j in 1..<minusArr.count {
            total -= minusArr[j]
        }
        return total
    } else {
        return minusArr[0]
    }
}

let input = readLine()!
print(solution(input))
