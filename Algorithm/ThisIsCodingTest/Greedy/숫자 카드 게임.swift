//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

// 이코테 p.96 실전문제3) 숫자 카드 게임
import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

private func cardGame() -> Int {
    // 각 행별로 최솟값 찾고, 그중 max 값 출력
    var minList = [Int]()

    for nums in arr {
        minList.append(nums.min()!)
    }
    return minList.max()!
}

print(cardGame())
