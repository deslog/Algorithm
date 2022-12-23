//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/22.
//

// 내이버 1번

import Foundation
//23415
//var A = [2,3,4,1,5]
//public func solution(_ A : inout [Int]) -> Int {
//    var visited = Array(repeating: false, count: A.count)
//    var answer = 0
//
//    for i in A {
//        visited[i-1] = true
//        for j in 0...i-1 {
//            if visited[j] == false {
//                break
//            } else if j == i-1 {
//                answer += 1
//            }
//        }
//    }
//    return answer
//}
//
//print(solution(&A))

// 네이버 2번
//var S = "abccbd"
//var C = [0,1,2,3,4,5]
//var S = "aabbcc"
//var C = [1,2,1,2,1,2]
//
////var S = "aaaa"
////var C = [3,4,5,6]
//public func solution(_ S : inout String, _ C : inout [Int]) -> Int {
//    let arrS = S.map{ String($0) }
//    var cost = 0
//    var temp = [Int]()
//
//    for i in 1..<arrS.count {
//        if arrS[i-1] == arrS[i] {
//            if temp.isEmpty {
//                temp.append(C[i-1])
//            }
//            temp.append(C[i])
//
//            if i == arrS.count - 1 {
//                for j in 0..<temp.count {
//                    if j != temp.count - 1 {
//                        cost += temp[j]
//                    }
//                }
//            }
//        } else {
//            for j in 0..<temp.count {
//                if j != temp.count - 1 {
//                    cost += temp[j]
//                }
//            }
//            temp = [Int]()
//        }
//    }
//
//    return cost
//}
//
//print(solution(&S, &C))

// 네이버3번

var A = 6
var B = 1
var C = 1 //aabaacaa

//var A = 0
//var B = 1
//var C = 8 //ccbcc

public func solution(_ A : Int, _ B : Int, _ C : Int) -> String {

    var arrA = Array(repeating: "a", count: A)
    var arrB = Array(repeating: "b", count: B)
    var arrC = Array(repeating: "c", count: C)

    var answer = ""

    var divA = arrA.count / 2
    var divB =
}



// 네이버 4번

//var A = [5,4,-3,2,0,1,-1,0,2,-3,4,-5]
//
//public func solution(_ A : inout [Int]) -> Int {
//    var count = 1
//    var prev = 0
//    var curr = 0
//    var answer = [Int]()
//
//    if A[0] > 0 {
//        prev = 1
//    } else if A[0] < 0 {
//        prev = -1
//    } else {
//        prev = 0
//    }
//
//    for i in 1..<A.count {
//        if A[i] < 0 {
//            curr = -1
//        } else if A[i] > 0 {
//            curr = 1
//        } else if A[i] == 0 && prev == -1 {
//            curr = 1
//        } else if A[i] == 0 && prev == 1 {
//            curr = -1
//        }
//
//        if curr != prev {
//            count += 1
//            prev = curr
//        } else {
//            count = 1
//            prev = curr
//        }
//        answer.append(count)
//    }
//    return answer.max()!
//}
//
//print(solution(&A))
