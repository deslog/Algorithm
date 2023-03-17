//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/17.
//

// 이게 대표적으로 정렬을 우선적으로 하고 이진탐색 진행

import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let m = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map{ Int($0)! }

func binarySearch(arr: [Int], start: Int, end: Int, target: Int) -> Bool {
    var start = start
    var end = end

    while start <= end {
        let mid = start + ((end - start) / 2)

        if arr[mid] == target {
            return true
        } else if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return false
}

for i in 0..<m {
    let target = nums[i]

    if binarySearch(arr: a, start: 0, end: n-1, target: target) {
        print(1)
    } else {
        print(0)
    }
}
