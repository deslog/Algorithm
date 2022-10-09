//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/09.
//

import Foundation

let s = "3people unFollowed me"

func solution(_ s:String) -> String {
    let slist = s.lowercased().map{ String($0) }
    var result = ""
    result += slist[0].uppercased()
    for i in 1..<slist.count {
        if slist[i-1] == " " {
            result += slist[i].uppercased()
        } else {
            result += slist[i]
        }
    }
    return result
}

print(solution(s))
