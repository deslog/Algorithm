//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/12.
//

// 이코테 - 그리디 - [예제]

import Foundation

let wallet = [500, 100, 50, 10, 5, 1]

func giveChange(_ wallet: [Int]) -> Int {
    var result = 0
    var change = 1000 - Int(readLine()!)!
    for coin in wallet {
        let coinCount = change / coin
        result += coinCount
        change -= coin * coinCount
    }
    return result
}

print(giveChange(wallet))
