//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/23.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

private func solution() {
    var left = 0
    var right = k
    var answer = 0

    while left <= right {
        let mid = (left + right) / 2
        var minCount = 0

        for i in 1..<n+1 {
            minCount += min(mid / i, n)
        }

        // 여기 범위가지고 노는게 힘드네
        // min <= k 일때 answer = mid 로 갱신해주면 안되는데
        // 왜 항상 크거나 같을때 갱신해줘야하는거지?
        // 이유 -> 감자블로그에 포스팅 완료 https://didu-story.tistory.com/437
        if minCount < k {
            left = mid + 1
        } else {
            answer = mid
            right = mid - 1
        }
    }

    print(answer)
}

solution()
