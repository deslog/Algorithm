//
//  9012_괄호.swift
//  Boj Algorithm
//
//  Created by 이지수 on 2022/02/03.
//

import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    let line = readLine()!
    var count = 0
    for char in line{
        if char == "(" {
            count += 1
        } else if char == ")" {
            count -= 1
            if count < 0 {
                break
            }
        }
        
    }
    print(count==0 ? "YES" : "NO")
}
