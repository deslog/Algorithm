import Foundation

let fees = [120, 0, 60, 591]
let records = ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]

//[0, 591]

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let basicTime = fees[0]
    let basicFee = fees[1]
    let perTime = fees[2]  // 단위 시간
    let perFee = fees[3]  //단위요금
    var result: [[Int]] = []
    var recordDic: [Int: [Int]] = [:]
    
    for record in records {
        let temp = record.split(separator: " ").map{ String($0) }
        let carName = Int(temp[1])!
        
        if recordDic[carName] == nil {
            recordDic[carName] = [calculateTime(time: temp[0])]
        } else {
            recordDic[carName]!.append(calculateTime(time: temp[0]))
        }
    }
    
    
    for (key, value) in recordDic {
        var resultTotalTime = 0
        var nowIdx = 1
        
        var tempValue: [Int] = value
        // out이 없는 경우 23시 59분 추가
        if value.count % 2 != 0 {
            tempValue.append(calculateTime(time: "23:59"))
        }
        
        // 2, 4, 6,,, 번째에서 앞꺼 빼기
        while nowIdx < tempValue.count {
            let calTime = tempValue[nowIdx] - tempValue[nowIdx-1]
            resultTotalTime += calTime
            nowIdx += 2
        }
        result.append([key, resultTotalTime])
    }
    
    let realResult = result.sorted(by: {$0[0] < $1[0]})
    
    var returnValue: [Int] = []
    for i in 0..<realResult.count {
        returnValue.append(calculateResult(basicFee: basicFee, basicTime: basicTime, perFee: perFee, perTime: perTime, arr: realResult[i]))
    }
    return returnValue
}
    
func calculateTime(time: String) -> Int {
    let tempTime = time.split(separator: ":").map{Int(String($0))!}
    return tempTime[0]*60 + tempTime[1]
}

func calculateResult(basicFee: Int, basicTime: Int, perFee: Int, perTime: Int,arr: [Int]) -> Int {
    var total = arr[1]
    var result = basicFee
    
    // 기본 시간을 뺀 주차요금을 낼 시간 구하기
    if total > basicTime {
        total = total - basicTime
    } else {
        total = 0
    }
    
    if total > 0 {
        if total % perTime != 0 {
            result += Int((total / perTime + 1) * perFee)
        } else {
            result += Int(total / perTime * perFee)
        }
    }
    return result
}

