let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
let N = nm[0]
let M = nm[1]


var result: [Int] = []
var visited = Array(repeating: false, count: N)

func dfs(num: Int) {
    
    if num == M {
        print(result.map({String($0)}).joined(separator: " "))
        return
    }
    
    for i in 0..<N {
        if visited[i] == false {
            visited[i] = true
            result.append(nums[i])
            dfs(num: num+1)
            visited[i] = false
            result.removeLast()
        }
    }
}

dfs(num: 0)
