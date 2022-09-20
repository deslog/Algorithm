//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/20.
//

import Foundation

func solution() {
    let stick = readLine()!.map { String($0) }
    var cutStick = 0
    var tempStack = 0

    for i in 0..<stick.count {
        if stick[i] == "(" {
            tempStack += 1
        } else { // == ")"
            tempStack -= 1
            if stick[i-1] == "(" { // 레이저
                cutStick += tempStack // 지금까지 쌓인 스틱들 모두 더해주기
            } else { // ")" 라서 막대기가 하나 더잇는상황이면
                cutStick += 1
            }
        }
    }
    print(cutStick)
}

solution()
