//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/04/11.
//

var nanjaeng: [Int] = []

for _ in 0..<9 {
    nanjaeng.append(Int(readLine()!)!)
}

nanjaeng.sort()
var sum = 0
for n in nanjaeng {
    sum += n
}

for_loop: for i in 0..<9 {
    for j in (i+1)..<9 {
        if (sum - nanjaeng[i] - nanjaeng[j]) == 100 {
            for k in 0..<9 {
                if k != i && k != j {
                    print(nanjaeng[k])
                }
            }
            break for_loop
        }
    }
}
