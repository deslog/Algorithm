//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/26.
//

var num = Int(readLine()!)!
var ans = ""

while true {
    if num == -1 {
        ans += "11"
        break
    } else if num == 0 {
        ans += "0"
        break
    } else if num == 1{
        ans += "1"
        break
    }
    
    if num < 0 {
        if num % 2 != 0 {
            num += -1
            num /= -2
            ans += "1"
        } else {
            num /= -2
            ans += "0"
        }
    }
    else if num > 0 {
        if num % 2 != 0 {
            num -= 1
            num /= -2
            ans += "1"
        } else {
            num /= -2
            ans += "0"
        }
    }
}

print(String(ans.reversed()))
