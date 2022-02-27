//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/27.
//

import Foundation

var num = Int(readLine()!)!
let n = Int(sqrt(Double(num)))

for i in 2..<n {
    while num % i == 0 {
        num /= i
        print(i)
    }
}

if num != 1 {
    print(num)
}
 
