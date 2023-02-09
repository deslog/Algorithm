//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/09.
//

// 611. valid triangle number

import Foundation

class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: <)
        var answer = 0

        if nums.count >= 3 {
            for k in 2..<nums.count {
                var i = 0
                var j = k-1
                while i < j {
                    if nums[i] + nums[j] > nums[k] {
                        answer += j - i
                        j -= 1
                    } else {
                        i += 1
                    }
                }
            }
            return answer
        }
        return 0
    }
}

let sol = Solution()
print(sol.triangleNumber([4,4,4]))
