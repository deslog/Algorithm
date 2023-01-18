import Foundation

let LC = readLine()!.split(separator: " ").map{ Int(String($0))! }
let l = LC[0]
let c = LC[1]

var charList = readLine()!.split(separator: " ").map{ String($0) }.sorted(by: <)
var visited = Array(repeating: false, count: c) //c개 만큼 false 생성 (방문체크)
var depth = 0 //bfs 돌릴 깊이
let aeiou = ["a", "e", "i", "o", "u"]
let consonant = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"]
var result: [String] = []


func dfs(depth: Int, start: Int) {
    
    // 원하는 자릿수로 암호가 만들어지면, 조건 체크
    if depth == l {
        var containAeiou = false
        var consonantCnt = 0
        
        // 최소 한개 이상, 존재하는지만 확인
        for v in aeiou {
            if result.contains(v) {
                containAeiou = true
            }
        }
        
        // 자음 개수 세어줘야함.
        for i in result {
            if consonant.contains(i) {
                consonantCnt += 1
            }
        }
        
        if consonantCnt >= 2 && containAeiou == true {
            print(result.joined(separator: ""))
        }
        return
    }
    
    // dfs
    for i in start..<c{
            if !visited[i] {
                visited[i] = true
                result.append(charList[i])
                dfs(depth: depth + 1, start: i)
                visited[i] = false
                result.removeLast()
            }
        }
}

dfs(depth: depth, start: 0)
