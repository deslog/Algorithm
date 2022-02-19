//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/19.
//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var bro = readLine()!.split(separator: " ").map { Int(String($0))! }

func gcd(_ m: Int, _ n: Int) -> Int {
    if n == 0 {
        return m
    } else if m % n == 0 {
        return n
    } else {
        return gcd(n, m%n)
    }
}


for b in bro {
    
}
