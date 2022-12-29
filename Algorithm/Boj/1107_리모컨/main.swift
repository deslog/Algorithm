//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/29.
//

import Foundation

// 1. + - 로만 이동하는 횟수
// 2. 숫자로 이동
// 3. 숫자로이동 + 플마버튼으로 이동
// 위 세개 비교

private func solution() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var brokenBtn = [Int]()
    if m != 0 {
        brokenBtn = readLine()!.split(separator: " ").map { Int($0)! }
    }

    // +-로만 이동하는 횟수
    var minCnt = abs(n - 100)

    // 숫자버튼을 눌러서 이동하는 경우 전부 테스트
    // 숫자버튼으로 i를 눌렀을 때랑, +-로만 이동할때랑 비교해주는 부분
    for i in 0...1000000 {
        let pressNumButton = pressCloseNumber(n: i, brokenBtn: brokenBtn)

        if pressNumButton > 0 {
            let pressNumAndPlusMinus = abs(n - i) // 채널 i로 이동했으니까, 거기서 +-눌러주는 횟수
            minCnt = min(minCnt, pressNumAndPlusMinus + pressNumButton)
        }
    }

    print(minCnt)
}

private func pressCloseNumber(n: Int, brokenBtn: [Int]) -> Int {
    var n = n

    if n == 0 {
        if brokenBtn.contains(n) {
            return 0
        } else {
            return 1
        }
    }

    var buttonPressCnt = 0
    while n > 0 {
        if brokenBtn.contains(n % 10) {
            return 0
        }

        n /= 10
        buttonPressCnt += 1
    }
    return buttonPressCnt
}

solution()
