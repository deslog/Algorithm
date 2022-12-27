//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/27.
//

import Foundation

private func solution() {
    let isprime = primeNumArr()

    for _ in 0..<100000 {
        var flag = false
        let n = Int(readLine()!)!

        if n == 0 {
            break
        } else {
            for i in 3...n {
                if isprime[i] {
                    let diff = n - i
                    if isprime[diff] {
                        flag = true
                        print("\(n) = \(i) + \(diff)")
                        break
                    }
                }
            }
        }

        if !flag {
            print("Goldbach's conjecture is wrong.")
        }
    }
}

private func primeNumArr() -> [Bool] {
    var isprimenum = Array(repeating: true, count: 1000001)
    isprimenum[0] = false
    isprimenum[1] = false

    for i in 2..<1000001 {
        if isprimenum[i] == false { continue }

        for j in stride(from: i+i, through: 1000000, by: i) {
            isprimenum[j] = false
        }
    }
    return isprimenum
}

solution()
