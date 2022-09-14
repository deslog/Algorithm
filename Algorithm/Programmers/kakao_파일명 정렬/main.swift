//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/14.
//

import Foundation


//let files = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
//let files = ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]
let files = ["ABC12", "AbC12", "aBc12"]

func solution(_ files:[String]) -> [String] {
    var newFiles = splitFiles(files)

    let customSort: ([String], [String]) -> Bool = { a, b in
        if a[0].lowercased() != b[0].lowercased() {
            return a[0].lowercased() < b[0].lowercased() // 다르다면 사전순정렬
        } else {
            if let n1 = Int(a[1]), let n2 = Int(b[1]), n1 != n2 {
                return n1 < n2 // 숫자다르다면 큰순으로 정렬
            }
        }
        return false // 문자도 같고 숫자도 같다면 안바꿈
    }

//    for f in sortedFiles {
//        var temp = ""
//        for i in 0..<f.count {
//            temp += f[i]
//        }
//        answer.append(temp)
//    }

    newFiles.sort(by: customSort)
    return newFiles.map{$0.joined()}
}

func splitFiles(_ files: [String]) -> [[String]] {
    let symbol = [".", "-", " "]
    var splitFiles = [[String]]()
    for f in files {
        var head = ""
        var num = ""
        var tail = ""
        var istail = false
        for char in f {
            if (char.isLetter && istail) || (istail && symbol.contains(String(char))) {
                tail += String(char)
            } else if char.isNumber {
                num += String(char)
                istail = true
            } else if (!istail && char.isLetter) || (!istail && symbol.contains(String(char))) {
                head += String(char)
            }
        }
        splitFiles.append([head, num, tail])
    }
    return splitFiles
}

print(solution(files))
