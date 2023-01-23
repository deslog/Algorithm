//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/01/20.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer: Int = 0
    var newBoard = Array(repeating: Array(repeating: 0, count: board[0].count+1), count: board.count+1)

    for i in 0..<board.count {
        for j in 0..<board[i].count {
            newBoard[i+1][j+1] = board[i][j]
        }
    }

    for i in 1..<newBoard.count {
        for j in 1..<newBoard[i].count {
            if newBoard[i][j] != 0 {
                newBoard[i][j] = min(newBoard[i][j-1], newBoard[i-1][j], newBoard[i-1][j-1]) + 1
                answer = max(newBoard[i][j], answer)
            }
        }
    }
    return answer * answer
}

let board = [[0,0,1,1],[1,1,1,1]]
print(solution(board))
