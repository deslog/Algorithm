//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/02.
//

import Foundation

let n = 5
let lost = [2, 4]
let reserve = [1, 3, 5]

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var total = n
    var lost = lost.sorted(by: <)
    var reserve = reserve.sorted(by: <)

    for num in lost {
        if reserve.contains(num) {
            reserve.remove(at: reserve.firstIndex(of: num)!)
            lost.remove(at: lost.firstIndex(of: num)!)
        }
    }

    for l in lost {
        if reserve.contains(l-1) {
            reserve.remove(at: reserve.firstIndex(of: l-1)!)
        } else if reserve.contains(l+1) {
            reserve.remove(at: reserve.firstIndex(of: l+1)!)
        } else {
            total -= 1
        }
    }

    return total
}

print(solution(n, lost, reserve))
