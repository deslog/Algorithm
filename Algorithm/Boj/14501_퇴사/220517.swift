var n = Int(readLine()!)!
var tp: [[Int]] = []
var dp = Array(repeating: 0, count: 100)

for i in 0..<n {
    tp.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<n {
    if dp[i] > dp[i+1] {
        dp[i+1] = dp[i]
    }

    if dp[i+tp[i][0]] < dp[i] + tp[i][1] {
        dp[i+tp[i][0]] = dp[i] + tp[i][1]
    }
}

print(dp[n])
