//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/10.
//

//import Foundation
//
//let n = Int(readLine()!)!
//var words = [String]()
//for _ in 0..<n {
//    let temp = readLine()!
//    if !words.contains(temp) {
//        words.append(temp)
//    }
//}
//
//let sortArr = words.sorted {
//    if $0.count == $1.count {
//        return $0 < $1
//    } else {
//        return $0.count < $1.count
//    }
//}
//
//for word in sortArr {
//    print(word)
//}

// 배열로 구현하면 시간초과남 -> 하하 set이 더 빠름

import Foundation

let n = Int(readLine()!)!
var words = Set<String>()
for _ in 0..<n {
    words.insert(readLine()!)
}

let sortArr = words.sorted {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

for word in sortArr {
    print(word)
}
