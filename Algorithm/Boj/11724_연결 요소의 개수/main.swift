// n : 노드(정점)의 개수
// m : 간선 개수 (연결요소)

var nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
var graph = Array(repeating: [], count: nm[0]+1)
var visited = Array(repeating: false, count: nm[0]+1)
var answer = 0
var depth = 0

for _ in 0..<nm[1] {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[uv[0]].append(uv[1])
    graph[uv[1]].append(uv[0])
}

func dfs(_ start: Int ,_ depth: Int) {
    visited[start] = true // 들어가자마자 방문처리 go
    for i in 0..<graph[start].count{ // 노드와 연결된 노드들 차례대로 방문
        let next = graph[start][i]
        if visited[next as! Int] == false{ // 만약 방문하지 않았던 노드면
            dfs(next as! Int, depth + 1) // 방문해서 다시 탐색
        }
    }
}

// main
for i in 1..<nm[0]+1 {
    if !visited[i] { //방문하지 않은 노드이고
        if graph[i].isEmpty { // 더이상 방문할 노드가 없다면 (그래프의 연결이 끊겼다면)
            answer += 1 // 새로운 그래프가 생성된것이기 때문에 answer += 1
            visited[i] = true // 그런 다음, 방문처리 go
        } else { // 연결된 그래프가 있다면
            dfs(i, 0) // dfs로 다음 다음 노드를 탐색하기 위해 dfs 재귀
            answer += 1 // 재귀가 끝나면 answer +=1
        }
    }
}

print(answer)
