let n = Int(String(readLine()!))!
var s = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: false, count: n)
var result: [Int] = []
var team1 = 0
var team2 = 0
var minResult = 99999

for i in 0..<n {
    s[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func dfs(depth: Int, start: Int) {
    // depth 가 반이됐다는 뜻은 이미 한 팀 구성이 완료 됐다는 뜻
    // 그래서 depth/2 가 되면, 팀구성못한애들을(false) team2에 넣어줌!!
    if depth == n/2 {
        team1 = 0
        team2 = 0
        for i in 0..<n{
            for j in 0..<n{
                if !visited[i] && !visited[j]{
                    team2 += s[i][j]
                }
                if visited[i] && visited[j] {
                    team1 += s[i][j]
                }
            }
        }
        // 그리고 팀구성이 완료된 애들의 차를 구해서 min값을 계속 갱신시켜주자
        minResult = min(minResult, abs(team1 - team2))
        return
    }
    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth + 1, start: i)
            visited[i] = false
        }
    }
}

dfs(depth: 0, start: 0)
print(minResult)
