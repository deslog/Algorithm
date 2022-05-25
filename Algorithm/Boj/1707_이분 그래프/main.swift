let K = Int(String(readLine()!))!
var flag = 0
var graph: [[Int]] = [[]]
var visited: [Int] = []

for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph = Array(repeating: [Int](), count: VE[0]+1) // node 수 보다 +1
    visited = Array(repeating: 0, count: VE[0]+1)
    flag = 1 // 1: 이분그래프, -1: 아닌그래프
    for _ in 0..<VE[1] {
        let uv = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph[uv[0]].append(uv[1])
        graph[uv[1]].append(uv[0])
    }
    
    for k in 1..<VE[0]+1 {
        if visited[k] == 0 {
            let tem = bfs(k)
            if tem == false {
                flag = -1
                break
            }
        }
    }
    
    if flag == 1 {
        print("YES")
    } else if flag == -1 {
        print("NO")
    }
}

func bfs(_ v: Int) -> Bool {
    visited[v] = 1
    var deque: [Int] = []
    deque.append(v)

    while !deque.isEmpty {
        let a = deque.removeFirst()

        for i in graph[a] {
            if visited[i] == 0 { //방문하지 않은 노드라면
                visited[i] = -visited[a] // visited 에는 1, -1 로 정점 색을 구별
                deque.append(i) //연결된 다음 노드느 i가 될 것
            } else {
                if visited[i] == visited[a] { // 같다면, 접한 정점의 색이 같다는 뜻 -> false
                    return false
                }
            }
        }
    }
    return true
}
