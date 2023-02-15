//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/15.
//

import Foundation

let n = Int(readLine()!)!
var dict = [Int:Int]()
var result = 0

for _ in 0..<n {
    let cow = readLine()!.split(separator: " ").map{ Int($0)! }
    let cowNum = cow[0]
    let cowPlace = cow[1]

    if dict.keys.contains(cowNum) {
        if dict[cowNum] != cowPlace {
            result += 1
            dict[cowNum] = cowPlace
        }
    } else {
        dict[cowNum] = cowPlace
    }
}

print(result)
