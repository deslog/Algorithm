//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/01.
//

import Foundation

let expression = "100-200*300-500+20"
// result = 60420

func solution(_ expression:String) -> Int {

    // 최종 리턴할 result
    var resultList = [Int]()

    // input을 List로 바꿔주기
    var num = ""
    var arr = [String]()
    expression.forEach { char in
        if char.isNumber {
            num += String(char)
        } else {
            arr.append(num) // 지금까지 쌓아놨던 숫자 추가
            arr.append(String(char)) // 연산자 추가
            num = "" //num 초기화
        }
    }
    arr.append(num) // 마지막 숫자 넣어줘야해 (이거때문에 시간 개잡아먹었네)
    print(arr)

    // 연산자
    let operatorList = [["+", "-", "*"], ["+", "*", "-"],
                        ["-", "+", "*"], ["-", "*", "+"],
                        ["*", "-", "+"], ["*", "+", "-"]]

    var newArr = arr

    operatorList.forEach { operators in
        // newArr에 1개만 남을때까지 -> 연산하면 결국 하나의 결과만 남으니까
        while newArr.count > 1 {
            operators.forEach { op in
                while newArr.contains(op) { // 연산자 있는대로 계산해야하니까 while문
                    let i =  newArr.firstIndex(of: String(op))! // op 인덱스 번호 찾아
                    var result = 0

                    if op == "+" {
                        result = Int(newArr[i-1])! + Int(newArr[i+1])!
                    } else if op == "-" {
                        result = Int(newArr[i-1])! - Int(newArr[i+1])!
                    } else if op == "*" {
                        result = Int(newArr[i-1])! * Int(newArr[i+1])!
                    }
                    // 연산자와 앞뒤 숫자 지워주고, 그자리에 넣어야해
                    newArr.remove(at: i-1)
                    newArr.remove(at: i-1)
                    newArr.remove(at: i-1)
                    newArr.insert(String(result), at: i-1)
                }
            }
        } // while newArr.count > 1 종료지점

        let temp = Int(newArr[0])!
        resultList.append(abs(temp))
        newArr = arr // 다음 연산자 세트를 위해서 다시 초기화
    }

    return resultList.max()!
}

print(solution(expression))
