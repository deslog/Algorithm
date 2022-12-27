//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/27.
//

import Foundation


public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}

//private func solution() {
//    let nm = readLine()!.split(separator: " ").map{ Int($0)! }
//    for i in nm[0]...nm[1]{
//        var flag = false
//        for j in 2..<i {
//            if i % j == 0 {
//                flag = true
//            }
//        }
//        if !flag {
//            print(i)
//        }
//    }
//}
//
//private func solution2() {
//    let nm = readLine()!.split(separator: " ").map{ Int($0)! }
//    for i in nm[0]...nm[1]{
//        var flag = false
//        for j in 2..<Int(sqrt(Double(i))) + 1 {
//            if i % j == 0 {
//                flag = true
//            }
//        }
//        if !flag {
//            print(i)
//        }
//    }
//}
//
//print(progressTime {
//    solution()
//})
//
//
//print(progressTime {
//    solution2()
//})

private func solution3() {
    let nm = readLine()!.split(separator: " ").map{ Int($0)! }
    var isprimenum = Array(repeating: true, count: 1000001)
    isprimenum[1] = false
    for i in 2..<1000001 {
        if isprimenum[i] == false {
            continue
        }

        for j in stride(from: i+i, through: 1000000, by: i) {
            isprimenum[j] = false
        }
    }

    for k in nm[0]...nm[1] {
        if isprimenum[k] == true {
//            print(k)
        }
    }
}

print(progressTime {
    solution3()
})
