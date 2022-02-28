//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/27.
//

import Foundation

var num = Int(readLine()!)!
let n = Int(sqrt(Double(num)))

for i in stride(from: 2, to: num, by: 1) {
    while num % i == 0 {
        num /= i
        print(i)
    }
}


if num != 1 {
    print(num)
}
 
