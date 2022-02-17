//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/17.
//


let line = readLine()!
var answer = ""

for ch in line {
    var rot13 = ch.asciiValue!
    
    if rot13 >= 65 && rot13 <= 90 {
        rot13 += 13
        if rot13 > 90 {
            rot13 -= 26
        }
    } else if rot13 >= 97 && rot13 <= 122 {
        rot13 += 13
        if rot13 > 122 {
            rot13 -= 26
        }
    }
    answer += "\(UnicodeScalar(rot13))"
}

print(answer)




/* ------- 런타임 에러 -------
 dictionary를 사용하니까 많은 메모리를 차지하나보다.
 다른 방안을 찾아보다가, 그냥 아스키코드로 해결했다.
let line = Array(readLine()!)
var answer: [Character] = []
let dic: [String:Character] = ["a":"n", "b":"o", "c":"p", "d":"q", "e":"r", "f":"s", "g":"t", "h":"u",
                                  "i":"v", "j":"w", "k":"x", "l":"y", "m":"z", "n":"a","o":"b", "p":"c", "q":"d",
                                  "r":"e", "s":"f", "t":"g", "u":"h", "v":"i", "w":"j", "x":"k", "y":"l", "z":"m",]

for l in line {
    if l.asciiValue! >= 65 && l.asciiValue! <= 90 {
        answer.append(Character(dic[String(l.lowercased())]!.uppercased()))
    } else {
        answer.append(dic[String(l)]!)
    }
}

print(answer.map { "\($0)"}.joined(separator: ""))
*/
