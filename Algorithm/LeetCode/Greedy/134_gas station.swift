//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/09.
//

// 134 - gas station

import Foundation

// ❌ 시간초과 실패 시간복잡도 o(n^2)
class Solution_1 {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        for startNum in 0..<gas.count {
            var answer = 0
            var isPossibleTravel = true
            // 내부를 차례대로 순환하면서 더해주기
            for idx in startNum..<gas.count+startNum {
                let index = idx % gas.count
                answer += gas[index] - cost[index]

                if answer < 0 {
                    isPossibleTravel = false
                    break
                }
            }

            if isPossibleTravel {
                return startNum
            }
        }

        return -1
    }
}

// 두번째 시도
// 차액을 for문돌면서 계산하지말고 미리 다 계산하고
// 차액의 합을 먼저 봐버려 -> break걸리는 지점이 빨라지겟지?
// 차액 전부 
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        // 일단 차액 다 계산해
        let gasCostArr = (0..<gas.count).map{ gas[$0] - cost[$0] }

        // 먼저 안되면 나가버려
        if gasCostArr.reduce(0,+) < 0 {
            return -1
        }

        var answerIdx = 0
        var sum = 0

        for startNum in 0..<gas.count {
            sum += gasCostArr[startNum]
            // 만약 sum이 음수가 되는 순간, 그 수부터는 시작할수없다는뜻
            // sum그냥 0으로 만들어서 다음부터 다시 새롭게 더해주고
            // answerIdx는 현재 index다음 걸로 넘겨줌
            if sum < 0 {
                sum = 0
                answerIdx = startNum + 1
            }
        }

        // 어차피 모두 더해서 음수가되는 경우는 미리 처리를 해줫으니까
        // 한바퀴 다돌아서 인덱스번호가 넘어가버리면 -1출력하고 아니면 그거 출력해주면될듯?
        return answerIdx > gas.count ? -1 : answerIdx
    }
}

// test case
let gas = [5,1,2,3,4]
let cost = [4,4,1,5,1]
print(Solution().canCompleteCircuit(gas, cost))
