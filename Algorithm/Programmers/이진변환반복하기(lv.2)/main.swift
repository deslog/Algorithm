//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/11.
//

import Foundation

let s = "110010101001" // 결과 [3, 8]

func solution(_ s: String) -> [Int] {
    var zerocount = 0
    var rotation = 0
    var copyS = s

    while copyS != "1" {
        let deleteZeroNum = copyS.filter { $0 == "1" }
        zerocount += copyS.count - deleteZeroNum.count
        copyS = String(deleteZeroNum.count, radix: 2)
        rotation += 1
    }
    return [rotation, zerocount]
}

print(solution(s))

//    while result != "10" {
//        rotation += 1
//        var deleteZeroCount = copyS.components(separatedBy: "0").joined().count
//        zerocount += copyS.count - deleteZeroCount
//        var result = String(deleteZeroCount, radix: 2)
//        if result == "10" {
//            break
//        }
//        print("result는 \(result)")
//        print(type(of: result))
//        copyS = result
//    }

//    return [rotation, zerocount]
//}

//func deleteZeroCount(_ s: String) -> Int {
//    var result = s.components(separatedBy: "0").joined().count
//    return result
//}

//func makeBinaryScale(_ num: Int) -> String {
//    var binaryNum = num
    //    var result = ""
    //    while true {
    //        let quot = binaryNum / 2
    //        let remainder = binaryNum % 2
    //
    //        if quot != 1 {
    //            result += String(remainder)
    //            binaryNum = quot
    //        } else if quot == 1 {
    //            result += String(remainder)
    //            result += "1"
    //            break
    //        }
    //    }
    //
    //    return String(result.reversed())
//}

//print(makeBinaryScale(111))
