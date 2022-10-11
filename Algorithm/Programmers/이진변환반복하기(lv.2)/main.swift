//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/11.
//

import Foundation

let s = "110010101001" // 결과 [3, 8]

func solution(_ s: String) -> [Int] {
    var zerocount = 0
    var rotation = 0
    var copyS = s
    var deletezero = 0
    var ans = [Int]()

    while true {
        rotation += 1
        print(rotation)
        // 0제거한 길이 구하고, count에 제거된 0개수 더해주기
        deletezero = deleteZeroCount(copyS)
        zerocount += copyS.count - deletezero

        // deletezero 이진법으로 바꾸기
        let result = makeBinaryScale(deletezero)

        if result != "1" {
            copyS = result
        } else {
            break
        }
    }
    ans.append(rotation)
    ans.append(zerocount)
    return ans
}

func deleteZeroCount(_ s: String) -> Int {
    var result = s.components(separatedBy: "0").joined().count
    return result
}

func makeBinaryScale(_ num: Int) -> String {
    var binaryNum = num
    var result = ""
    while true {
        print("여기지롱")
        let quot = binaryNum / 2
        let remainder = binaryNum % 2

        if quot != 1 {
            result += String(remainder)
        } else {
            result += String(remainder)
            result += "1"
            break
        }
        binaryNum = quot
    }

    return String(result.reversed())
}

print(solution(s))
