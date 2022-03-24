//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/24.
//

let count = Int(readLine()!)!

for _ in 1...count {
    let n = Int(readLine()!)!
    var arr: [Array<Int>] = []
    for _ in 0...1 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr.append(input)
    }
    
    let result = sticker(n: n, arr: arr)
    
    if n == 1 {
        print(max(result[0][0], result[1][0]))
    } else if n == 2 {
        print(max(result[0][1], result[1][1]))
    } else {
        print(max(result[0][n-1], result[1][n-1]))
    }
}


func sticker(n: Int, arr: Array<Array<Int>>) -> Array<Array<Int>> {
    var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
    dp[0][0] = arr[0][0]
    dp[1][0] = arr[1][0]
    
    if n > 1 {
        dp[0][1] = arr[1][0] + arr[0][1]
        dp[1][1] = arr[0][0] + arr[1][1]
        
        for i in 2..<n {
           dp[0][i] = max(dp[1][i-1] + arr[0][i], dp[1][i-2] + arr[0][i])
           dp[1][i] = max(dp[0][i-1] + arr[1][i], dp[0][i-2] + arr[1][i])
           
        }
    }
    return dp
}
