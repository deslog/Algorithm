import Darwin
var nmv = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]

var visited = Array(repeating: false, count: n+1)
var matrix = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for i in 0..<m {
    let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix[nums[0]][nums[1]] = 1
    matrix[nums[1]][nums[0]] = 1
}

func dfs(_ v: Int) {
    visited[v] = true
    print(v, terminator: " ")
    for i in 1..<n+1 {
        if visited[i] == false && matrix[v][i] == 1 {
            dfs(i)
        }
    }
}


func bfs(_ v: Int) {
    var queue: [Int] = []
    visited[v] = false // dfs 돌아가면서 true 로 바뀐거 false 로 돌리면서 go
    queue.append(v)
    
    while !queue.isEmpty {
        var newV = queue.removeFirst()
        print(newV, terminator: " ")
        
        for i in 1..<n+1 {
            if visited[i] == true && matrix[newV][i] == 1 {
                queue.append(i)
                visited[i] = false
            }
        }
        
    }
    
}

dfs(v)
print("")
bfs(v)
