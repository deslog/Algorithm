//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/04/12.
//

import Foundation

let n = Int(readLine()!)!
var result = 0
var input: [Array<Character>] = []
for _ in 0..<n {
    input.append(Array(readLine()!))
}

for i in 0..<n {
    for j in 0..<n-1 {
    
        input[i].swapAt(j,j+1)
        row_count()
        col_count()
        input[i].swapAt(j,j+1)
        
        var temp = input[j][i]
        input[j][i] = input[j+1][i]
        input[j+1][i] = temp
        
        row_count()
        col_count()
        
        temp = input[j][i]
        input[j][i] = input[j+1][i]
        input[j+1][i] = temp
     
    }
}

func row_count() {
    for i in 0..<n {
        var count = 1
        for j in 0..<n-1 {
            if input[i][j] == input[i][j+1] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
            result = max(result,count)
        }
    }
}

func col_count() {
    for i in 0..<n {
        var count = 1
        for j in 0..<n-1 {
            if input[j][i] == input[j+1][i] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
            result = max(result, count)
        }
    }
}

print(result)
