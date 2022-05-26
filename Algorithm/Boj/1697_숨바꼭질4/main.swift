// reference - https://velog.io/@sun02/Swift-%EB%B0%B1%EC%A4%80-13913-%EC%88%A8%EB%B0%94%EA%BC%AD%EC%A7%88-4

import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = NK[0]
let destination = NK[1]

var queue = [Int]()
var time = 0
var check = Array(repeating: false, count: 100001)
var footPrints = Array(repeating: -1, count: 100001)
var result = [Int]()

func bfs(_ start:Int) {
    queue.append(start)
    check[start] = true // 방문처리
    
    while !check[destination] { // 아직 목표까지 도달하지 않았다면 계속 while문 실행
        time += 1
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            
            for i in [node+1, node-1, node*2] {
                if 0...100000 ~= i && !check[i]{ // 만약 i 가 0부터 100000사이에 있다면 그리고 방문하지 않았다면
                    queue.append(i)
                    footPrints[i] = node
                    check[i] = true
                }
            }
        }
    }
    print(time)
}

bfs(start)
var prior = footPrints[destination]
result.append(destination)
while prior != -1 {
    result.append(prior)
    prior = footPrints[prior]
}

result.reverse()
print(result.map{String($0)}.joined(separator: " "))
