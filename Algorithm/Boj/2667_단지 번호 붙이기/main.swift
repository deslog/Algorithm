let n = Int(String(readLine()!))!
var graph = [[Int]]()
var cntList = [Int]()
var cnt = 0
let dx = [-1, 1, 0, 0] //위 아 왼 오
let dy = [0, 0, -1, 1]

for _ in 0..<n {
    graph.append(Array(readLine()!.map{ Int(String($0))! }))
}

func dfs(_ i: Int, _ j: Int) -> Int {
    var deque = [(Int, Int)]()
    deque.append((i, j))
    graph[i][j] = 0 // 방문처리
    cnt = 1
    
    while !deque.isEmpty {
        let tem = deque.removeFirst()
        let x = tem.0
        let y = tem.1
        
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            }
            
            if graph[nx][ny] == 1 {
                graph[nx][ny] = 0
                deque.append((nx, ny))
                cnt += 1
            }
        }
    }
    return cnt
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == 1 {
            cntList.append(dfs(i,j))
        }
    }
}

print(cntList.count)
cntList.sort()
for i in cntList {
    print(i)
}
