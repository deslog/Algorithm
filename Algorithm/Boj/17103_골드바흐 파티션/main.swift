////
////  main.swift
////  Algorithm
////
////  Created by 이지수 on 2022/03/01.
////
///
///

import Foundation

let n = Int(readLine()!)!

//소수 생성 함수
func isPrimeNumber (n: Int) -> Array<Bool> {
    var check = Array(repeating: true, count: n+1)
    check[0] = false
    check[1] = false

    for i in 0..<Int(sqrt(Double(n)))+1 {
        if check[i] == true {
            var j = 2

            while (i*j) <= n {
                check[i*j] = false
                j += 1
            }
        }
    }
    return check
}


//입력받기
for i in 0..<n {
    let num = Int(readLine()!)! //입력받은 수
    var count = 0
    let primeNums = isPrimeNumber(n: num) //입력받은 num까지 존재하는 소수

    for j in stride(from: 2, through: num/2, by: 1) {
        if primeNums[j] == true { //num-j한 결과가 소수면 count+1
            if primeNums[num-j] == true {
                count+=1
            }
        }
    }

    print(count)
}


/*------------ 2차 ----------------*/
//import Foundation
//
//let n = Int(readLine()!)!
//
////소수 생성 함수
//func isPrimeNumber (n: Int) -> Array<Int> {
//    var primeNums: [Int] = []
//    var check = Array(repeating: true, count: n+1)
//    check[0] = false
//    check[1] = false
//
//    for i in 0..<Int(sqrt(Double(n)))+1 {
//        if check[i] == true {
//            var j = 2
//
//            while (i*j) <= n {
//                check[i*j] = false
//                j += 1
//            }
//        }
//    }
//
//    for i in 0..<check.count {
//        if check[i] == true {
//            primeNums.append(i)
//        }
//    }
//    return primeNums
//}
//
//
////입력받기
//for i in 0..<n {
//    let num = Int(readLine()!)! //입력받은 수
//    var count = 0
//    let primeNums = isPrimeNumber(n: num) //입력받은 num까지 존재하는 소수
//
//    for j in stride(from: 2, through: num/2, by: 1) {
//        if primeNums.contains(j) { //num-j한 결과가 소수면 count+1
//            if primeNums.contains(num-j) {
//                count+=1
//            }
//        }
//    }
//
//    print(count)
//}

//*------------ 1차 ----------------*/
//import Foundation
//
//let n = Int(readLine()!)!
//
////소수 생성 함수
//func isPrimeNumber (n: Int) -> Array<Int> {
//    var primeNums: [Int] = []
//    var check = Array(repeating: true, count: n+1)
//    check[0] = false
//    check[1] = false
//
//    for i in 0..<n+1 {
//        if check[i] == true {
//            var j = 2
//
//            while (i*j) <= n {
//                check[i*j] = false
//                j += 1
//            }
//        }
//    }
//
//    for i in 0..<check.count {
//        if check[i] == true {
//            primeNums.append(i)
//        }
//    }
//    return primeNums
//}
//
//
////입력받기
//for i in 0..<n {
//    let num = Int(readLine()!)! //입력받은 수
//    var count = 0
//    let primeNums = isPrimeNumber(n: num) //입력받은 num까지 존재하는 소수
//
//    for j in stride(from: 2, through: num/2, by: 1) {
//        if primeNums.contains(j) { //num-j한 결과가 소수면 count+1
//            if primeNums.contains(num-j) {
//                count+=1
//            }
//        }
//    }
//
//    print(count)
//}
