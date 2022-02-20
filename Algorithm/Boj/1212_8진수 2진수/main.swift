//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/20.
//


var input = Array(readLine()!)

for i in 0..<input.count {
    var num = Int(String(input[i]))!
    var answer = ""

    while num != 1 {
        answer += String(num%2)
        num = num/2
    }
    answer += "1"

    if i>0 && answer.count == 1 {
        answer += "00"
    } else if i>0 && answer.count == 2{
        answer += "0"
    }
    print(String(answer.reversed()), terminator: "")
}

