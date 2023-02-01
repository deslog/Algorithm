//
//  1이 될때 까지.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int($0)! }
var n = nk[0]
let k = nk[1]
var cnt = 0

while n != 1 {
    if n % k == 0 {
        n = n / k
    } else {
        n = n - 1
    }
    cnt += 1
}

print(cnt)
