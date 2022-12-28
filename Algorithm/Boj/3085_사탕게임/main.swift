//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/28.
//

import Foundation

private enum type {
    case colCount
    case rowCount
}

private func solution() {
    var result = [Int]()
    let n = Int(readLine()!)!
    var candy = [Array<Character>]()
    for _ in 0..<n {
        candy.append(Array(readLine()!))
    }

    for i in 0..<n {
        for j in 0..<n-1 {

            // 행끼리 바꿈
            candy[i].swapAt(j, j+1)
            result.append(countCloseCandy(type: type.rowCount, n: n, candy: candy))
            result.append(countCloseCandy(type: type.colCount, n: n, candy: candy))
            candy[i].swapAt(j, j+1)

            // 열바꿈
            var temp = candy[j][i]
            candy[j][i] = candy[j+1][i]
            candy[j+1][i] = temp
            result.append(countCloseCandy(type: type.rowCount, n: n, candy: candy))
            result.append(countCloseCandy(type: type.colCount, n: n, candy: candy))
            temp = candy[j][i]
            candy[j][i] = candy[j+1][i]
            candy[j+1][i] = temp
        }
    }
    print(result.max()!)
}

private func countCloseCandy(type: type, n: Int, candy: [Array<Character>]) -> Int {
    var result = -999
    for i in 0..<n {
        var count = 1
        for j in 0..<n-1 {
            switch type {
            case .colCount:
                if candy[i][j] == candy[i][j+1] {
                    count += 1
                } else {
                    result = max(result, count)
                    count = 1
                }
            case .rowCount:
                if candy[j][i] == candy[j+1][i] {
                    count += 1
                } else {
                    result = max(result, count)
                    count = 1
                }
            }
        }
        result = max(result, count)
    }
    return result
}

solution()
