//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/23.
//

import Foundation

let nmoil = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nmoil[0]
let m = nmoil[1] // 태워야하는 승객 수
let oil = nmoil[2] //연료의 양

var mapArray = [Array(repeating: 0, count: n+1)] // 지도
for _ in 0..<n+1 {
    var temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    temp.insert(0, at: 0)
    mapArray.append(temp)
}

var taxi = readLine()!.split(separator: " ").map { Int(String($0))! }

var passenger_start = [[Int]]()
var passenger_end = [[Int]]()
for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    passenger_start.append([temp[0], temp[1]])
    passenger_end.append([temp[2], temp[3]])
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]  // 위 아 왼 오

// 거리가 가장 짧은 passenger 찾기 -> 최단거리 -> bfs
func findPassenger() {
    var visited = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var passenger = [[Int]]()
    var minDistance = 99999
    var queue = [[Int]]()
    queue.append(taxi)

    while !queue.isEmpty {
        let pop = queue.removeFirst()
        let y = pop[0]
        let x = pop[1]

        // 지금 visited에 있는 사람이 minDistance 보다 크면 그냥 break (최단거리아님)
        if visited[y][x] > minDistance {
            break
        }

        if passenger_start.contains(pop) {

        }

    }
}
