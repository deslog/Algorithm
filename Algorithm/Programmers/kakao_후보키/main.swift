//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/08/31.
//

import Foundation

let relation = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]

//조합들을 담을 배열
var cases = [[Int]]()

func solution(_ relation:[[String]]) -> Int {
    var candidateKey = [[Int]]()
    var colsize = [Int]()

    for i in 0..<relation[0].count {
        colsize.append(i)
    }
    // 컬럼수들의 조합 생성
    for i in 0..<colsize.count {
        combination(n: colsize, m: i+1, current: 0, pickedArray: [])
    }

    // 최소성 확인 isSuperset() 부분집합인지 확인
    out: for c in cases {
    //최소성을 만족하는지 확인
        let set = Set(c)
        //후보키들을 탐색
        for key in candidateKey {
            //후보키 안에 현재 key가 포함된게 있다면 넘어간다.
            if set.isSuperset(of: key) {
                continue out
            }
        }

        var rowSet = Set<Array<String>>()
        // row별로 combi에 있는 속성들만 뽑아서 확인
        for row in relation {
            var tuple = [String]()

            for i in c {
                tuple.append(row[i])
            }

            if !rowSet.contains(tuple) {
                rowSet.insert(tuple)
            } else {
                break
            }
        }

        if rowSet.count == relation.count {
            candidateKey.append(c)
        }
    }

    return candidateKey.count
}

//n개중 m를 순서에 상관없이 뽑아야할 조합들을 만들어주는 함수
func combination(n: [Int], m: Int, current index: Int, pickedArray: [Int]) {
    if m == 0 {
        cases.append(pickedArray)
    }else if index == n.count {
        return
    }else {
        var newSelected = pickedArray
        newSelected.append(n[index])
        combination(n: n, m: m-1, current: index+1, pickedArray: newSelected)
        combination(n: n, m: m, current: index+1, pickedArray: pickedArray)
    }
}

print(solution(relation))
