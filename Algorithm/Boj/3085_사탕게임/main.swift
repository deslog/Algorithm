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
    
        // 자리 바꿔서 result 갱신해주고
        input[i].swapAt(j,j+1)
        row_count()
        col_count()
        //다시 자리 바꿔줌
        input[i].swapAt(j,j+1)
        
        //열끼리 자리 바꿀건데, 값을 temp 에 저장해뒀다가 값을 줘야해.
        var temp = input[j][i]
        input[j][i] = input[j+1][i]
        input[j+1][i] = temp
        
        row_count()
        col_count()
        
        // 원래자리로 돌려
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
