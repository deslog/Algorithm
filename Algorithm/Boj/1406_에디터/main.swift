//
//  1406_에디터.swift
//  Boj Algorithm
//
//  Created by 이지수 on 2022/02/03.
//

import Foundation

/*
 시간초과

import Foundation

var text = Array(readLine()!)
let n = Int(readLine()!)!


var cursor = text.count

for _ in 0..<n {
    var edit = readLine()!.components(separatedBy: " ")

    switch edit.removeFirst() {
        case "L" :
        if cursor > 0 {
            cursor -= 1
        }

        case "D" :
        if cursor != text.count {
            cursor += 1
        }

        case "B" :
        if cursor != 0 {
            text.remove(at:cursor-1)
            cursor -= 1
        }

        case "P" :
        var t = edit.popLast()!
        text.insert(contentsOf: t , at: cursor)
        cursor += 1

        default :
            break
    }

}
print(String(text))

*/

var left = Array(readLine()!)
var right: [Character] = []
let n = Int(readLine()!)!

for _ in 0..<n {
    let edit = readLine()!
    switch edit {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D" :
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B" :
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(edit.last!)
    }
}

print(String(left+right.reversed()))
