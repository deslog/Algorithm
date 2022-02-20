//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/20.
//

let n = Int(readLine()!)!

func gcd(_ m: Int, _ n: Int) -> Int {
    if n == 0 {
        return m
    } else {
        return gcd(n, m%n)
    }
}


for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var result: [Int] = []
    for i in 1..<input.count - 1 {
        for j in i+1..<input.count {
            result.append(gcd(input[i], input[j]))
        }
    }
    print(result.reduce(0, +))
}


/*3
 4 10 20 30 40
 3 7 5 12
 3 125 15 25
 예제 출력 1
 70
 3
 35
*/
