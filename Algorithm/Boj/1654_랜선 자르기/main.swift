//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/04.
//

import Foundation

let kn = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = kn[0]
let n = kn[1]
var cables = [Int]()
for _ in 0..<k {
    cables.append(Int(readLine()!)!)
}

func solution(k: Int, n: Int, cables: [Int]) -> Int {
    var start = 1
    var end = cables.max()!
    var result = 0

    while start <= end {
        let mid = (start + end) / 2
        var tempResult = 0
        for cable in cables {
            tempResult += cable/mid
        }

        // 만약 tempResult가 n보다 작으면 길이 줄여줘야함, end를 mid로
        if tempResult < n {
            end = mid - 1
        } else { // 만약 tempResult가 n보다 크면, 길이를 늘려줘야함 start를 mid로
            //그리고 결과는 n보다 크게나와도 되니까 result(랜선의 최대길이)를 갱신하면서 진행
            start = mid + 1
            result = mid
        }

        print("while문 언제 탈출해?")
    }
    return result
}

print(solution(k: k, n: n, cables: cables))
