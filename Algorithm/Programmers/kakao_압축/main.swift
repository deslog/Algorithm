//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/13.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var dict = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5,
                "F": 6, "G": 7, "H": 8, "I": 9, "J": 10,
                "K": 11, "L": 12, "M": 13, "N": 14, "O": 15,
                "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20,
                "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25,
                "Z": 26]
    let input = msg.map { String($0) }
    var answer = [Int]()
    var count = 0 // count 해가면서 while문을 돌릴 거임
    var w = "" // str에다가 더해가면서 진행
    while count < input.count {
        let c = input[count] // 다음글자
        let tempwc = w + c
        let isinDict = wcCheckInDict(w, c, dict: dict)

        if !isinDict { // dict에 존재하지 않으면
            dict[tempwc] = dict.count + 1 // 일단 dict 에 w+c 추가
            answer.append(dict[w]!) // 그리고 answer에는 w value 출력
            w = ""
            continue
        }

        w += c
        count += 1
    }
    answer.append(dict[w]!)
    return answer
}

func wcCheckInDict(_ w: String, _ c: String, dict: [String:Int]) -> Bool {
    let wc = w+c
    let isinDict = dict.contains { $0.key == wc }
    return isinDict
}

let msg = "TOBEORNOTTOBEORTOBEORNOT"
// 결과 [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
let a = solution(msg)
print(a)


//    while input.count >= 0 {
//        // w+c가 dict에 있으면 wc 갱신해주고, 다음으로 넘겨야함
//        let isinDict = wcCheckInDict(w, c, dict: dict)
//        if isinDict {
//            w = w+c
//            c = input[0]
//            continue
//        } else if input.count == 0 { // 마지막 인경우
//            answer.append(dict[w]!)
//            break
//        } else { // 없으면 w+c를 dict에 넣어줌 그리고 마지막에 w와 c를 바꿔줘야함
//            dict[w+c] = valueNum
//            valueNum += 1
//
//            answer.append(dict[w]!)
//            w = input.removeFirst()
//            if input.count == 0 {
//                c = "9999"
//                continue
//            }
//            c = input[0]
//        }
//    }
