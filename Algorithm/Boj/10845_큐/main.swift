//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/04.
//

import Foundation

let n = Int(readLine()!)!
var answer: [String] = []


for _ in 0..<n {
    var order = readLine()!.split(separator: " ").map { String($0) }
    switch order[0] {
    case "push":
        answer.append(order.last!)
    case "pop":
        if answer.isEmpty {
            print(-1)
        } else{
            print(answer.removeFirst())
        }
    case "size":
        print(answer.count)
    case "empty":
        if answer.isEmpty {
            print(1)
        }else{
            print(0)
        }
    case "front":
        if answer.isEmpty {
            print(-1)
        }else{
            print(answer[0])
        }
    default :
        if answer.isEmpty {
            print(-1)
        }else{
            print(answer.last!)
        }
    }
}

