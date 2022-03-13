//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/13.
//

let n = Int(readLine()!)!
let inputArray = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp: [Int] = []

for i in 0..<n {
    dp.append(1)
    for j in 0..<i+1 {
        if inputArray[i] > inputArray[j] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}
print(dp.max()!)

var maxDp = dp.max()!
var maxIdx = dp.firstIndex(of:maxDp)!
var answer: [Int] = []

while maxIdx >= 0 {
    if dp[maxIdx] == maxDp {
        answer.append(inputArray[maxIdx])
        maxDp -= 1
    }
    maxIdx -= 1
}

for i in stride(from: answer.count-1, through: 0, by: -1) {
    print(answer[i], terminator: " ")
}
