//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/16.
//

while let input = readLine() {
    
    var str = Array(input)
    var lower = 0
    var upper = 0
    var num = 0
    var space = 0
    
    for i in str {
        if i >= "a" && i <= "z" {
            lower += 1
        } else if i >= "A" && i <= "Z" {
            upper += 1
        } else if i == " " {
            space += 1
        } else {
            num += 1
        }
    }
    print("\(lower) \(upper) \(num) \(space)")
}


