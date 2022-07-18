//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/07/19.
//

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var weigth = [Int]()
var value = [Int]()
weigth.append(0)    // index 1로 맞춰줄라고 0 넣어줌
value.append(0)
for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    weigth.append(temp[0])
    value.append(temp[1])
}
var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)

for i in 1..<n+1 {
    for j in 1..<k+1 {
        if i == 1 {   // 1번 물건일 때는 j가 1번무게보다 크면 그냥 바로 넣어줌
            if j >= weigth[i] {
                dp[i][j] = value[i]
            }
        } else {     // 2번 물건부터 비교하면서 시작
            if weigth[i] > j {
                dp[i][j] = dp[i-1][j]
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-weigth[i]]+value[i])
            }
        }
    }
}

print(dp[n][k])
