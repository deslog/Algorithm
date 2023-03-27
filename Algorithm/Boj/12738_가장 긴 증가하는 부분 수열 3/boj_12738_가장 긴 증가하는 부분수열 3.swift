//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/27.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var lis = [arr[0]]

private func binarySerach(start: Int, end: Int, target: Int) -> Int {
    if start > end {
        return start
    }

    // mid는 index번호
    let mid = (start + end) / 2

    if lis[mid] > target { // 수열에 있는애가 target보다 크면 줄여줘야하니까 mid를 end로
        return binarySerach(start: start, end: mid - 1, target: target)
    } else if lis[mid] < target {
        return binarySerach(start: mid + 1, end: end, target: target)
    } else { // 같을 경우엔 mid가 정답
        return mid
    }
}

for i in 1..<n {
    if lis[lis.count - 1] < arr[i] {
        lis.append(arr[i])
    } else {
        lis[binarySerach(start: 0, end: lis.count - 1, target: arr[i])] = arr[i]
    }
}

print(lis.count)
