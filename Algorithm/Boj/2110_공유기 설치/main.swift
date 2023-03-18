//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/18.
//

import Foundation

let nc = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nc[0]
let c = nc[1]
var home = [Int]()

for _ in 0..<n {
    home.append(Int(readLine()!)!)
}
home.sort()

var left = 1
var right = home[home.count - 1] - home[0]
var answer = -999

while left <= right {
    var start = home[0]
    var cnt = 1
    let mid = (left + right) / 2

    // mid 기준으로 home 리스트 돌면서 공유기 설치 가능한지 확인
    for i in 0..<n {
        let d = home[i] - start
        // mid보다 커야 공유기 설치 가능
        if mid <= d {
            cnt += 1
            start = home[i]
        }
    }

    // 범위를 어떻게 줄여나가는거야?
    // let mid = (left + right) / 2
    // 공유기가 넘 많으면 -> mid를 넓혀야해 mid를 넓힐라면? left를 right쪽으로 가야 mid가 커짐
    // 공유기가 넘 적으면 -> mid를 줄여야해 mid를 줄일라면? right를 left쪽으로 가줘야 mid가 작아짐
    if c <= cnt {
        answer = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)
