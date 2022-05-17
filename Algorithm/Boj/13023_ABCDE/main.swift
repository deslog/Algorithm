var nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph = Array(repeating: Array(repeating: 0, count: nm[0]), count: nm[0])
var visited = Array(repeating: false, count: nm[0]+1)
var answer = false

for _ in 0..<nm[1] {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[ab[0]].append(ab[1])
    graph[ab[1]].append(ab[0])
}

func dfs(idx: Int, depth: Int) {
    visited[idx] = true
    if depth == 4 {
        answer = true
        return
    }
    
    for i in graph[idx] {
        
        if !visited[i] { //아직 방문하지 않았으면
            visited[i] = true
            dfs(idx: i, depth: depth+1)
            visited[i] = false
        }
    }
}


for i in 0..<nm[0]{
    dfs(idx: i, depth: 0)
    visited[i] = false
    
    if answer {
        break
    }
}
    
if answer{
    print(1)
} else {
    print(0)
}

