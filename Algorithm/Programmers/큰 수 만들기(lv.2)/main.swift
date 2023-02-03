//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/03.
//

import Foundation

// ❌ 시간초과
// 이중 for문을 사용해서 O(n^2)의 복잡도가 된다.
// 가장 큰수가 1,000,000 이므로 100만x100만으로 본다면 1억이기 때문에 시간초과가 난다.

//func solution(_ number:String, _ k:Int) -> String {
//    let numArr = number.map{ Int(String($0))! }
//    var answer = ""
//    var nextIdx = 0
//    var currentIdx = 0
//
//    for i in 0..<number.count - k {
//        var tempMax = -999
//        for j in nextIdx...i+k {
//            if tempMax < numArr[j] {
//                tempMax = numArr[j]
//                currentIdx = j
//            }
//        }
//        answer += String(tempMax)
//        nextIdx = currentIdx + 1
//    }
//
//    return answer
//}

// ✅ stack을 활용한 풀이

func solution(_ number:String, _ k:Int) -> String {
    let numArr = number.map{ Int(String($0))! }
    var answer = [Int]()
    var newk = k

    for i in 0..<number.count {
        // 아직 k번만큼 안지워졋고, answe가 비워져있지 않고, answer의 마지막에 있는 값이 지금 넣으려는 값보다 작으면
        // answer에 있는 마지막 값을 지워버리세요.
        while newk > 0, !answer.isEmpty, answer.last! < numArr[i] {
            answer.removeLast()
            newk -= 1
        }

        // 만약 k번만큼 전부 지웠다면
        // answer에 지금 검사하지 않은 남은 뒤에있는 numArr를 모두 넣어주세요.
        // 만약 k번만큼 전부 지우지 않았다면
        // answer에 지금의 numArr[i]를 넣어주세요.
        if newk <= 0 {
            answer.append(contentsOf: numArr[i...])
            break
        } else {
            answer.append(numArr[i])
        }
    }

    // prefix : 앞에서부터 원하는 갯수의 원소들만 출력해준다.
    // 우리는 number.count - k 자리수를 원해하기 때문에 넣어줘야한다.
    // number = 999 , k = 1 에서 answer은 [9, 9, 9]가 되기 때문에 여기서 한개만 출력해준다. prefix의 역할

    return String(answer.map{ String($0) }.joined().prefix(number.count-k))
}

let number = "1199911"
let k = 3
print(solution(number, k))
