//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/04/25.
//

import Foundation

func solution() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        let n = Int(readLine()!)!
        var price = readLine()!.split(separator: " ").map{ Int($0)! }
        var answer = 0

        var maxNum = price[price.count-1] // max초기값 그냥 맨뒤 값으로

        for i in stride(from: price.count-1, through: 0, by: -1) {
            if maxNum < price[i] { // maxnum보다 큰놈을 발견했다면 max를 갱신해줘
                maxNum = price[i]
            } else if price[i] < maxNum {
                answer += maxNum - price[i]
            }
        }

        print(answer)
    }
}

solution()
