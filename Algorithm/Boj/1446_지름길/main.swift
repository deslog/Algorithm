//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/22.
//

let nd = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nd[0]
let d = nd[1]
var start = [Int]()
var end = [Int]()
var shortcut = [Int]()
var distance = [Int]()
for i in 0..<d+1 {
    distance.append(i)
}
for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    start.append(temp[0])
    end.append(temp[1])
    shortcut.append(temp[2])
}

for j in 0..<d+1 {
    if j > 0 {
        distance[j] = min(distance[j-1]+1, distance[j])
    }
    for k in 0..<start.count {
        if j == start[k], end[k] <= d, distance[start[k]]+shortcut[k] < distance[end[k]] {
            distance[end[k]] = distance[start[k]]+shortcut[k]
        }
    }
}

print(distance[d])
