//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/12/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]
let c = input[2]
print((a+b)%c)
print(((a%c)+(b%c))%c)
print((a*b)%c)
print(((a%c)*(b%c))%c)
