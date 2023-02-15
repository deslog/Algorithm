//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/15.
//

import Foundation

let money = Int(readLine()!)!
let arr = [-1] + readLine()!.split(separator: " ").map{ Int($0)! }

private func bnp(_ money: Int) -> Int {
    var cash = money // 현금
    var cnt = 0 // 몇주

    for i in 1..<arr.count {
        if cash >= arr[i] {
            cnt += cash / arr[i]
            cash -= (cash / arr[i]) * arr[i]
        }
    }
    return cnt * arr[14] + cash
}

private func timing(_ money: Int) -> Int {
    var cash = money
    var cnt = 0

    for i in 4..<arr.count {
        if arr[i-3] < arr[i-2], arr[i-2] < arr[i-1], arr[i-1] < arr[i] {
            // 연속 상승, 한 주라도 있다면 다 팔아버려
            if cnt > 0 {
                cash += arr[i] * cnt
                cnt = 0
            }
        } else if arr[i-3] > arr[i-2], arr[i-2] > arr[i-1], arr[i-1] > arr[i] {
            // 연속 하락? 전부 다 사버려
            if cash >= arr[i] {
                cnt += cash / arr[i]
                cash -= (cash / arr[i]) * arr[i]
            }
        }
    }
    return cnt * arr[14] + cash
}

if bnp(money) == timing(money) {
    print("SAMESAME")
} else {
    bnp(money) > timing(money) ? print("BNP") : print("TIMING")
}
