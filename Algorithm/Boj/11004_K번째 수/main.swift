//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/03/11.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int($0)! }
var nums = readLine()!.split(separator: " ").map { Int($0)! }

// N의 범위는 500만까지 -> O(N^2)으로 하면 25억 -> 무조건 시간초과
// O(nlogn)으로 구현해야함 -> 병합정렬 / 퀵정렬

// 1️⃣ sort갈겨보기
// 일단 timsort방식을 사용하는 sort()먼저 써보자. O(nlogn)임
// 뭐 예상했던 대로 시간초과 ㅋㅋㅋㅋㅋ
//let sortedNums = nums.sorted(by: <)
//print(sortedNums[nk[1]-1])

// 2️⃣ 퀵정렬은 최악의 경우 N^2이니까 병합정렬로 구현해보자.
// 엥! 병합정렬 시간초과나는데!?

private func solution() {
    var sortedArr = partitionHoare(&nums, low: 0, high: nums.count - 1)
    print(sortedArr[nk[1]-1])
}

private func mergeSorting(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let mid = arr.count / 2
    let leftArr = mergeSorting(Array(arr[0..<mid]))
    let rightArr = mergeSorting(Array(arr[mid..<arr.count]))
    return merge(left: leftArr, right: rightArr)
}

private func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    var ordered = [Int]()

    while leftIdx < left.count, rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            ordered.append(left[leftIdx])
            leftIdx += 1
        } else if left[leftIdx] > right[rightIdx] {
            ordered.append(right[rightIdx])
            rightIdx += 1
        } else {
            ordered.append(left[leftIdx])
            ordered.append(right[rightIdx])
            leftIdx += 1
            rightIdx += 1
        }
    }

    while leftIdx < left.count {
        ordered.append(left[leftIdx])
        leftIdx += 1
    }

    while rightIdx < right.count {
        ordered.append(right[rightIdx])
        rightIdx += 1
    }

    return ordered
}

//solution()

// 3️⃣ 퀵소트로 구현해보기
// 일단 그냥 퀵소트로 구현하면 시간초과남

private func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }

    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }

    return quickSort(less) + equal + quickSort(greater)
}

solution()

func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1

    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot

        if i < j {
            a.swapAt(i, j)
        }
        else {
            return j
        }
    }
}

func quickSortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quickSortHoare(&a, low: low, high: p)
        quickSortHoare(&a, low: p + 1, high: high)
    }
}
