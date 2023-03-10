//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/02.
//

import Foundation

var location = [[String]]()
for _ in 0..<5 {
    location.append(readLine()!.map{ String($0) })
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func solution() {
    // 48만개 조합 생성
    let combiArr = combi(arr: Array(stride(from: 0, through: 24, by: 1)), n: 7)
    var answer = 0

    for c in combiArr {
        if checkScnt(arr: c) {
            if isConnection(arr: c) {
                answer += 1
            }
        }
    }


func checkScnt(arr: [Int]) -> Bool {
    // 다솜(S)가 4명 이상이면 true
    var sCnt = 0
    var yCnt = 0

    for i in 0..<7 {
        if sCnt >= 4 {
            return true
        } else if yCnt >= 4 {
            return false
        }

        let x = arr[i] / 5
        let y = arr[i] % 5
        if location[x][y] == "S" {
            sCnt += 1
        } else if location[x][y] == "Y" {
            yCnt += 1
        }
    }

    if sCnt >= 4 {
        return true
    }

    return false
}

func isConnection(arr: [Int]) -> Bool {
    var check = Array(repeating: false, count: 7) // arr에 맞춰서 인덱스로 구별
    var queue = [(Int, Int)]()

    func bfs(index: Int) {
        queue.append((arr[index] / 5, arr[index] % 5))
        check[index] = true

        while !queue.isEmpty {
            let temp = queue.removeFirst()
            let x = temp.0
            let y = temp.1

            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 {
                    continue
                }

                if arr.contains((nx * 5) + ny), !check[arr.firstIndex(of: (nx * 5) + ny)!] {
                    check[arr.firstIndex(of: (nx * 5) + ny)!] = true
                    queue.append((nx, ny))
                }
            }
        }
    }

    bfs(index: 0)

    if check.filter({ $0 == true }).count == 7 {
        return true
    }

    return false
}

func combi(arr: [Int], n: Int) -> [[Int]] {
    var combiArr = [[Int]]()

    func dfs(index: Int, now: [Int]) {
        if now.count == n {
            combiArr.append(now)
            return
        }

        for i in index..<arr.count {
            dfs(index: i + 1, now: now + [arr[i]])
        }
    }

    dfs(index: 0, now: [])
    return combiArr
}

solution()
