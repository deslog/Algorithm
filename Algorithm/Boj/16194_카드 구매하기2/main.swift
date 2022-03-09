//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/03/10.
//

let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 999999, count: n+1)
//최소값을 추출해야하니까 dp 를 조건 범위 밖의 수로 채워넣어주었다.

dp[0] = 0
// 0을 넣어준 이유는, 아래 for 문을 돌면서 i=1,j=1 일때 dp[0]+p[0]이 계산될텐데, 이때 허수 999999 가 들어가면 안되기 때문이다.

for i in 1..<n+1 {
    for j in 1..<i+1 {
        dp[i] = min(dp[i], dp[i-j]+p[j-1])
    }
}
print(dp[n])
