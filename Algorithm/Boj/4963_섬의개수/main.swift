let dx = [-1, 1, 0, 0, -1, -1, 1, 1]
let dy = [0, 0, -1, 1, -1, 1, -1, 1] //위 아 왼 오 왼쪽위 오른쪽위 왼쪽아래 오른쪽아래

while true {
    var count = 0
    let wh = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    if wh == [0, 0] {
        break
    }

    var islandMap: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: wh[0]), count: wh[1])

    for _ in 0..<wh[1] {
        islandMap.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    func dfs(_ x: Int, _ y: Int) {
        for i in 0..<dx.count {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || nx > wh[0]-1 || ny < 0 ||  ny > wh[1]-1 {
                continue
            } else {
                if !visited[nx][ny] && islandMap[nx][ny] == 1 {
                    visited[nx][ny] = true
                    dfs(ny, nx)
                }
            }
        }
    }

    // main
    for i in 0..<wh[1] {
        for j in 0..<wh[0] {
            if islandMap[i][j] == 1 && !visited[i][j] {
                visited[i][j] = true
                dfs(i, j)
                count += 1
            }
        }
    }
    print(count)
}
