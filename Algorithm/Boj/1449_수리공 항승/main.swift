//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

import Foundation

let nl = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nl[0]
let tapeLen = nl[1]
let arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

var start = 0
var tapeCnt = 0

for i in 0..<n {
    // 일단 맨 처음 시작점을 지정해줌
    if i == 0 {
        tapeCnt += 1
        start = arr[i]
        continue
    }

    // 두번째 누수지점부터 확인하는데,
    // 누수지점 - currentplace < tapeLen 이어야먄 그 누수지점에 한 테이프로 붙일 수 있음
    // 누수지점 - currentplace >= tapeLen 이면 테이프 갯수 하나 더 더해주어야함
    if arr[i] - start >= tapeLen {
        tapeCnt += 1
        start = arr[i]
    }
}

print(tapeCnt)
