//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/19.
//

// 유형별풀이 - 그리디 - 곱하기 혹은 더하기 (p.312)

import Foundation

// 풀이: 0과 1은 더해주고 나머지는 곱해주는게 포인트

var numbers = readLine()!.map{ Int(String($0))! }
var result = numbers[0]

for i in 1..<numbers.count {
    if numbers[i] <= 1 || result <= 1 {
        result += numbers[i]
    } else {
        result *= numbers[i]
    }
}

print(result)
