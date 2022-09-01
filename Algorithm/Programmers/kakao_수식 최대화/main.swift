//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/02.
//

import Foundation

let expression = "100-200*300-500+20"
// result 60420

func solution(_ expression:String) -> Int {

    // expression 먼저 나누기
    let expressionArr = splitExprssion(expression)

    // 연산자 우선순위 배열 만들기
    let operators = [["+", "-", "*"], ["+", "*", "-"],
                     ["-", "+", "*"], ["-", "*", "+"],
                     ["*", "-", "+"], ["*", "+", "-"]]

    // 연산자 한 뭉탱이씩 계산
    var newArr = expressionArr // newArr에서 계속 삭제하면서 연산할거라 복사해서 사용하는 용도
    var result = 0 // 중간중간 연산값 저장
    var resultArr = [Int]() // 6개의 operators 결과를 넣을 arr
    operators.forEach { operatorSet in
        while newArr.count > 1 { // 하나의 operatorSet에서 newArr에 한개만 남으면 stop
            operatorSet.forEach { op in
                while newArr.contains(op) {
                    let idx = newArr.firstIndex(of: op)!
                    if op == "+" {
                        result = Int(newArr[idx-1])! + Int(newArr[idx+1])!
                    } else if op == "-" {
                        result = Int(newArr[idx-1])! - Int(newArr[idx+1])!
                    } else if op == "*" {
                        result = Int(newArr[idx-1])! * Int(newArr[idx+1])!
                    }
                    newArr.remove(at: idx-1)
                    newArr.remove(at: idx-1)
                    newArr.remove(at: idx-1)
                    newArr.insert(String(result), at: idx-1)
                }
            }
        }
        resultArr.append(abs(Int(newArr[0])!))
        newArr = expressionArr // 한 뭉탱이 끝났으니까 초기화
    }
    return resultArr.max()!
}

func splitExprssion(_ expression: String) -> [String] {
    var numChar = ""
    var expressionArr = [String]()
    expression.forEach {
        if $0.isNumber {
            numChar += String($0)
        } else {
            expressionArr.append(numChar)
            expressionArr.append(String($0))
            numChar = ""
        }
    }
    expressionArr.append(numChar)
    return expressionArr
}

print(solution(expression))
