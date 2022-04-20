//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/04/20.
//

var n = Int(readLine()!)!

var i = 1
var answer = 0
while i <= n {
    answer += (n-i+1)
    i *= 10
}

print(answer)
