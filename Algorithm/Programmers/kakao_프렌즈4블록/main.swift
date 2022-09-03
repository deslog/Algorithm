//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/03.
//

import Foundation

//let m = 4
//let n = 5
//let board = ["CCBDE", "AAADE", "AAABF", "CCBBF"]
// 결과값 : 14

// 다른 test case
//let m = 8
//let n = 2
//let board = ["CC", "BB", "AA", "BB", "BB", "AA", "BB", "CC"]
// 결과값 : 16

// 반례
let m = 5
let n = 6
let board = ["AAAAAA","BBAATB","BBAATB","JJJTAA","JJJTAA"]
// 결과값 : 24

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {

    // board를 2차원 배열로 바꿔주기
    var newBoard = splitBoard(board)

    // 지우는 좌표를 기록하기 위한 set 설정 & return 값 설정
    var removePoint = Set<[Int]>()
    var cnt = 0

    // 프렌즈 4블록이 없어질때까지 돌려야하니까, while 문으로 removePoint 조건 검사
    // 원래 while !removePoint.isEmpty 을 조건으로 주었는데, removePoint는 매번 초기화해주니까 이 조건은 안되는구나를 깨닳음
    while true {
        // 4블록 위치 찾아서 removePoint에 넣어주기
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let point = newBoard[i][j]
                // 만약 point 가 - 라면, 이미 제거된 위치이므로 continue
                if point == "-" {
                    continue
                }
                // 사방을 보고 다 point 와 같다면 removePoint에 해당 좌표 추가
                if newBoard[i][j+1] == point, newBoard[i+1][j] == point, newBoard[i+1][j+1] == point {
                    removePoint.insert([i, j])
                    removePoint.insert([i, j+1])
                    removePoint.insert([i+1, j])
                    removePoint.insert([i+1, j+1])
                }
            }
        }

        // removiPoint가 있으면 cnt 더해주고 블록 지우고, 없으면 끝 cnt 출력
        if !removePoint.isEmpty {
            cnt += removePoint.count
            for point in removePoint {
                newBoard[point[0]][point[1]] = "-"
            }
            removePoint = Set<[Int]>()
        } else {
            break
        }

        // 지금 블록 없는 곳이 "-"인데, 블록을 차례대로 밑으로 내려줘야함
        //        for i in 0..<m-1 {
        //            for j in 0..<n {
        //                let block = newBoard[i][j]
        //                let under = newBoard[i+1][j]
        //                if block != "-", under == "-" {
        //                    newBoard[i+1][j] = block
        //                    newBoard[i][j] = "-"
        //                } else {
        //                    continue
        //                }
        //            }
        //        }

        for j in stride(from: 0, to: n, by: 1) { //열
            var first = 0 //블록이 내려와야할 행 위치
            if newBoard[m-1][j] == "-" {
                first = m-1
            }

            for i in stride(from: m-2, through: 0, by: -1) { //행
                if newBoard[i][j] == "-" {
                    if i > first {
                        first = i
                    }
                } else if newBoard[i+1][j] == "-"{
                    newBoard[first][j] = newBoard[i][j]
                    newBoard[i][j] = "-"
                    first -= 1
                }
            }
        }
    }
    return cnt
}


func splitBoard(_ board: [String]) -> [[String]] {
    var newBoard = [[String]]()
    for b in board  {
        let arr = b.map { String($0) }
        newBoard.append(arr)
    }
    return newBoard
}

print(solution(m, n, board))
