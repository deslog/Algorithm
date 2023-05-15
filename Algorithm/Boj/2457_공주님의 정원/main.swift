//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/04/25.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var flowers = [(Int, Int)]()

    for _ in 0..<n {
        let temp = readLine()!.split(separator: " ").map{ Int($0)! }
        // 1차로 지는날이 3월1일 이전이면 아예 flowers에 넣어주지도 않음
        if temp[2]*100 + temp[3] < 301 {
            continue
        }
        // 2차로 피는 날이 301보다 이전이면, 아예 그냥 301로 바꿔서 넣어줌
        if temp[0]*100 + temp[1] < 301 {
            flowers.append((301, temp[2]*100 + temp[3]))
            continue
        }
        // 3차로 그 중간 범위에 포함되는 애들은 걍 넣어줌
        flowers.append((temp[0]*100 + temp[1], temp[2]*100 + temp[3]))
    }

    // 피는날 오름차순, 같으면 지는날은 내림차순 (길수록 앞에위치)
    flowers.sort {
        if $0.0 == $1.0 {
            return $0.1 > $1.1
        } else {
            return $0.0 < $1.0
        }
    }

    var max = 0
    var temp = 0
    var answerArr = [Int]()
    let start = 301
    let end = 1130
    var idx = 0

    // 301부터 피어있는 꽃이 없는 경우
    if flowers[idx].0 > 301 {
        return 0
    }

    // 입력받은 꽃이 1개인 경우
    if flowers.count == 1 {
        if flowers[idx].0 == start && flowers[idx].1 > end {
            return 1
        } else {
            return 0
        }
    }

    while idx < flowers.count {
        // 어차피 정렬, 맨처음거 일단선택
        if max > end {
            // max가 12월1일 이상이면 break, 더 볼 필요없음
            break
        }

        // 첫번째꺼, 301이후니까 무조건 선택
        if idx == 0 {
            max = flowers[idx].1 // 지는날이 max
            idx += 1
            answerArr.append(max)
            continue
        }

        // 지금 최종으로 지는날 max보다 지는날이 앞서면 그냥 pass
        if flowers[idx].1 < max {
            idx += 1
            continue
        }

        // 피는날은 max보다 작고, 지는날은 max보다 크면 (우리가 원하는 범위내)
        if flowers[idx].0 <= max, flowers[idx].1 > max {
            // 지금까지 순회한 꽃들 다음으로 탐색하면서 선택 가능성이 있는 꽃 찾아줌
            // 선택가능성? -> 피는날이 범위내에 들어오면서, 지는날은 더 늦는 것
            // 일단 temp에 임시로 지는날 저장해주고, 이 temp보다 큰애 찾아줘
            temp = flowers[idx].1

            for j in idx+1..<flowers.count {
                // 피는날은 우리가 만족하는 범위내고, 지는날은 현재 입력받은 temp보다 크면?
                if flowers[j].0 <= max, flowers[j].1 > temp {
                    temp = flowers[j].1
                } else {
                    break // 어차피 정렬을 해뒀기 때문에 위에 만족 안하면 pass해주는게 맞음
                }
            }

            max = temp
            answerArr.append(max)
        }

        idx += 1
    }

    print(answerArr)

    // 무조건 12월1일 이상으로 끝나야 카운트 가능
    if answerArr[answerArr.count-1] <= end {
        print("여기???")
        return 0
    }

    return answerArr.count
}

print(solution())
