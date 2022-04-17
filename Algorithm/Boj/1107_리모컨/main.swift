//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/04/17.
//

var n = Int(readLine()!)!
var num = Int(readLine()!)!
var breakBtn: [Int] = []
if num != 0 {
    breakBtn = readLine()!.split(separator: " ").map{Int(String($0))!}
}

// 채널로 도착할 수 있는 방법은 세가지
// 1. +-로만 이동
// 2. 숫자버튼을 눌러서 이동
// 3. 숫자버튼을 이용해서 가까운곳으로 이동, 그다음 +- 로 이동

// 이동하고 싶은 채널 n 에서 현재 채널 100을 빼준게 +- 로만 이동한 수
var minCnt = abs(n-100)

for i in 0...1000000 {
    //수빈이가 이동하려고하는 최대채널은 500000이지만,
    //채널이 무한대만큼 있다는 힌트를보고 생각해보면 500000보다 큰 수에서 뺄수도 있겟다 싶은데
    //극단적으로 설명하면 1에서 500000가는 것보다는 999000에서 500000가는게 더 가깝다.
    //그래서 0에서 500000을 가는 경우와 1000000에서 500000을 가는 경우를 모두 고려해야함.
    let len = check(i)
    if len > 0 {
        let press = abs(n - i) //+또는 -버튼을 눌렀을때의 경우가된다.(i만큼의 번호로 이동했기때문)
        minCnt = min(minCnt, len + press)
    }
}
print(minCnt)

// 숫자버튼으로 이동할 경우 숫자버튼 몇 번누르는지 알려주는 함수

func check(_ i: Int) -> Int{
    var n = i
    //n이 0이면 0번으로 이동한다는 말인데 0버튼이 부셔졌으면 0을리턴 아니면 1을리턴
    if n == 0 {
        if breakBtn.contains(0) {
            return 0
        }else{
            return 1
        }
    }
    
    var len = 0
    //n에서 누를 번호가 고장났는지를 판단해서 고장났으면 못누르니까 0리턴
    //고장안났으면 누를거니까 len에 +1
    while n > 0 {
        if breakBtn.contains(n % 10) {return 0}
        n = n / 10
        len += 1
    }
    return len
}



//python 참고 코드
//min_cnt = 0x3f3f3f3f
//num_int = 0
//btn_set = {i for i in range(0, 10)}
//
//
//def find(num):
//    global min_cnt, num_int, btn_set
//
//    for btn in btn_set:
//        tmp_num = num + str(btn)
//        min_cnt = min(min_cnt, abs(num_int - int(tmp_num)) + len(tmp_num))
//
//        if len(tmp_num) < 6:
//            find(tmp_num)
//
//
//def main():
//    global min_cnt, num_int, btn_set
//
//    num_int = int(input())
//    n = int(input())
//
//    min_cnt = min(min_cnt, abs(100 - num_int))
//    btn_set -= set(map(int, input().split(' '))) if n else set()
//
//    find('') if n < 10 else ''
//    print(min_cnt)
//
//
//main()
