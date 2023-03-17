//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/17.
//

import Foundation

let n = Int(readLine()!)!
let cities = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let budget = Int(readLine()!)!

func binarySerach(arr: [Int], start: Int, end: Int) -> Int {
    var start = start
    var end = end

    while start <= end {
        let mid = start + ((end - start) / 2)
        let total = sum(cities: cities, mid: mid)

        if budget >= total {
            start = mid + 1

        } else if budget < total {
            end = mid - 1
        }
    }

    return end
}

func sum(cities: [Int], mid: Int) -> Int {
    // 지방은 총 10000개 이하 -> O(10000)
    var total = 0
    for i in 0..<n {
        if mid > cities[i] {
            total += cities[i]
        } else {
            total += mid
        }
    }

    return total
}

print(binarySerach(arr: cities, start: 0, end: cities.max()!))
