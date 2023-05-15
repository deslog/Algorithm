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

    if flowers[0].0 > 301 {
        return 0
    }

    var start = flowers[0].0
    var end = flowers[0].1
    var flowerList = [0] // 첫번째꽃 무조건 선택 (이거 수정해야함. 만약 301보다 이후면?)
    var tempEnd = 0
    var idx = 0
    var flag = false

    while idx < flowers.count {
        if end > 1130 {
            // 답은 무조건 1201이상이어야함.
            return flowerList.count
        }

        for i in idx+1..<flowers.count {
            if flowers[i].0 > end { // 다음꽃이 end보다 늦게 피면, 나가도돼
                break
            }

            if flowers[i].0 == start {
                continue
            } else if flowers[i].0 > start, flowers[i].0 <= end, tempEnd < flowers[i].1 {
                // 순회중인 꽃의 시작점이 범위내에 있고, 이전에 비교해온 tempEnd보다 길면 그거선택해야하니까 temp 갱신
                flag = true
                tempEnd = flowers[i].1
                idx = i // idx갱신해줘야해 지금 그 위치에있는 꽃 선택했다고 알려줘야해.
            } else if flowers[i].1 <= end { // end보다 짧으면 볼필요도 없음
                continue
            }
        }

        if flag {
            end = tempEnd
            start = flowers[idx].0
            flowerList.append(idx)
            flag = false
        } else {
            return 0
        }
    }

    return flowerList.count
}

print(solution())

