//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/04/29.
//

import Foundation

var id_list = ["muzi", "frodo", "apeach", "neo"]
var report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
var k = 2


func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var idIdx:[String:Int] = [:]
    //신고당한사람 : 신고한사람
    var reported_report: [String:Set<String>] = [:]
    var count = Array(repeating: 0, count: id_list.count)
    
    for (i,id) in id_list.enumerated() {
            idIdx[id] = i
        }
    
    for r in report {
        let split = r.split(separator: " ")
        let reported = String(split[1])
        let report = String(split[0])
        
        if reported_report[reported] == nil {
            reported_report[reported] = [report]
        } else {
            reported_report[reported]!.insert(report)
        }
    }
    
    for r in reported_report {
        if r.value.count >= k {
            for i in r.value {
                count[idIdx[i]!] += 1
            }
        }
    }
    return count
}
