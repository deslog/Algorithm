//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/13.
//

import Foundation

let nmr = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var newArr = Array(repeating: Array(repeating: 0, count: m), count: n)

// 아래 오른쪽 위 왼쪽
let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

// 회전하는 사각형 개수 구해주기
let squareCnt = min(n, m) / 2

// 회전 함수
// x,y : 시작점
private func rotate(x: Int, y: Int, newN: Int, newM: Int) {
    var nx = x
    var ny = y

    for _ in 0..<r {
        if nx < newN, ny < newM {
            nx += dx[0]
            ny += dy[0]
        } else if nx == newN, ny < newM {
            nx += dx[1]
            ny += dy[1]
        } else if nx == newN, ny == newM {
            nx += dx[2]
            ny += dy[2]
        } else {
            nx += dx[3]
            ny += dy[3]
        }
    }
}

for s in 0..<squareCnt {
    // 각 사각형의 (i, i)가 시작점
    let newN = s + (n - s - 1) - 1
    let newM = s + (m - s - 1) - 1

    // 회전 후 위치를 찾는거지
    for i in 0..<n {
        for j in 0..<m {

        }
    }
}

