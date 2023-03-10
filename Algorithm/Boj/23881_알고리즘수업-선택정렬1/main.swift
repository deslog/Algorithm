//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/10.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
var cnt = 0

for i in stride(from: arr.count, to: 1, by: -1) {
    let tempMax = arr[0..<i].max()!
    if tempMax != arr[i-1] {
        cnt += 1
        if cnt == nk[1] {
            print("\(arr[i-1]) \(tempMax)")
            break
        }
        arr.swapAt(arr.firstIndex(of: tempMax)!, i-1)
    }
}

if cnt < nk[1] {
    print(-1)
}
