//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/15.
//

import Foundation

let n = Int(readLine()!)!
var dict = [String:Int]()

for _ in 0..<n {
    let temp = readLine()!.split(separator: ".").map{ String($0) }

    if !dict.keys.contains(temp[1]) {
        dict[temp[1]] = 1
    } else {
        dict[temp[1]]! += 1
    }
}

let sortedDict = dict.sorted { $0.0 < $1.0 }
for i in 0..<sortedDict.count {
    print("\(sortedDict[i].key) \(sortedDict[i].value)")
}
