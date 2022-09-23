//import Foundation
//
//let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let subin = nm[0]
//let dong = nm[1]
//let max = 100000
//var visited = Array(repeating: false, count: max+1)
//var result = 0
//
//if subin == dong {
//    print(0)
//} else {
//    var index = 0
//    var queue: [(now: Int, sec: Int)] = [(subin, 0)] // 현재위치, 걸린시간을 튜플로
//
//    while index < queue.count {
//        let node = queue[index]
//        index += 1
//
//        for i in 0..<3 {
//            var next = 0
//            switch i {
//            case 0: next = node.now - 1
//            case 1: next = node.now + 1
//            default: next = node.now * 2
//            }
//
//            if next == dong {
//                result = node.sec + 1
//                index = queue.count
//                break
//            } else { // 이미 방문했거나, 범위를 벗어나면 그냥 pass
//                if next < 0 || next > max || visited[next] == true {
//                    continue
//                }
//                visited[next] = true
//                queue.append((next, node.sec+1))
//            }
//        }
//    }
//    print(result)
//}


//1697 숨바꼭질

import Foundation

let MAX = 100000
let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var result = 0
let N = input[0]
let K = input[1]

if N == K {
    print(0)
} else {
    var queue: [(dot: Int, sec: Int)] = [(N, 0)]
    var visited: [Bool] = Array(repeating: false, count: MAX+1)
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<3 {
            var nextDot = 0
            
            switch i {
                case 0: nextDot = node.dot - 1
                case 1: nextDot = node.dot + 1
                default: nextDot = node.dot * 2
                
            }
            
            if nextDot == K {
                result = node.sec + 1
                index = queue.count
                break
                
            } else {
                if nextDot < 0 || nextDot > MAX || visited[nextDot] {
                    continue
                }
                visited[nextDot] = true
                queue.append((nextDot, node.sec+1))
                
            }
            
        }
        
    }
    print(result)
    
}
