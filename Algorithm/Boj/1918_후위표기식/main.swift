//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/12.
//

var line = Array(readLine()!)
var answer: [Character] = []
var stack: [Character] = []

func getPriority(op: Character) -> Int{
    switch op {
    case "+":
        return 1
    case "-":
        return 1
    case "*":
        return 2
    case "/":
        return 2
    case "(":
        return 0
    default:
        break
    }
    return 0
}

for op in line {
    if op.isLetter { // op가 ABC..(피연산자)이면 answer로 push
        answer.append(op)
    } else {
        if op == "(" { // ( 이면 stack으로 push
        stack.append(op)
        } else if op == ")" { // ) 이면 우선순위가 끝났다는 뜻이므로, stack에 있는 연산자를 pop하여 answer로 push
            while true { // 다 꺼내야하므로 반복문 활용
                let data = stack.removeLast()
                if data == "(" { break } // (가 나타나면 answer에 넣지 않으려고 break
                answer.append(data)
            }
        } else if stack.isEmpty || getPriority(op: op) > getPriority(op: stack.last!) {
            // stack이 비었거나, 현재 op의우선순위가 더 높으면 stack에 push
            stack.append(op)
        } else {
            // stack에 이미 연산자들이 존재하면서 현재 op의 우선순위가 낮을경우 (+,- 인경우)
            // stack에 있는 모든 연산자를 answer로 push한 후 stack으로 push 해야함
            while !stack.isEmpty {
                let temp = stack.last!
                if getPriority(op: temp) >= getPriority(op: op) {
                    let data = stack.removeLast()
                    answer.append(data)
                } else {
                    break
                }
            }
            stack.append(op)
        }
    }
}

// 위 단계가 모두 끝나면 stack에 쌓여있는 연산자를 하나씩 answer로 push
while !stack.isEmpty {
    answer.append(stack.removeLast())
}

print(String(answer))
