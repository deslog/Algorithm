//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/10/08.
//

import Foundation

let s = "1 2 3 4"
let ss = "-1 -2 -3 -4"

func solution(_ s:String) -> String {

    let news = s.split(separator: " ").map { Int(String($0))! }
    let result = "\(String(news.min()!)) \(String(news.max()!))"

    return result
}

func first_solution(_ s:String) -> String {

    var news = s.split(separator: " ").map { Int(String($0))! }
    var maxs = String(news.max()!)
    var mins = String(news.min()!)

    var result = ""
    result += mins
    result += " "
    result += maxs

    return result
}

print(solution(ss))
