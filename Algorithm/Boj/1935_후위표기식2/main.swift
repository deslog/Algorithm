//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/11.
//

import Foundation

let n = Int(readLine()!)!
var orderLine = readLine()!
var nums: [Double] = []
var stack: [Double] = []

for _ in 0..<n {
    let num = Double(readLine()!)!
    nums.append(num)
}

for order in orderLine {
    if order == "+" {
        stack.append(stack.removeLast()+stack.removeLast())
    } else if order == "-" {
        let a = stack.removeLast()
        stack.append(stack.removeLast() - a)
    } else if order == "*" {
        stack.append(stack.removeLast() * stack.removeLast())
    } else if order == "/" {
        let b = stack.removeLast()
        stack.append(stack.removeLast() / b)
    } else {
        let idx = order.asciiValue! - 65
        stack.append(nums[Int(idx)])
    }
}

print(String(format: "%.2f", stack[0]))

