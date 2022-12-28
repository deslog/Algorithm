//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/28.
//

import Foundation

private func solution() {
    var nanjaeng = [Int]()
    var totalSum = 0
    for _ in 0..<9 {
        let temp = Int(readLine()!)!
        nanjaeng.append(temp)
        totalSum += temp
    }

    nanjaeng.sort()
    loop: for i in 0..<9 {
        for j in i+1..<9 {
            if totalSum - nanjaeng[i] - nanjaeng[j] - 100 == 0 {
                for k in 0..<9 {
                    if k != i, k != j {
                        print(nanjaeng[k])
                    }
                }
                break loop
            }
        }
    }
}

solution()
