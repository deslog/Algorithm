//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

import Foundation

var count = 0

while let input = readLine() {
    if input == "0 0 0" {
        break
    }

    let lpv = input.split(separator: " ").map{ Int($0)! }
    let l = lpv[0]
    let p = lpv[1]
    let v = lpv[2]
    count += 1


    print("Case \(count): \(((v/p)*l) + (min(l, v%p)))")
}
