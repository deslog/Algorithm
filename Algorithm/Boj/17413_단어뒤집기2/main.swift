//
//  main.swift
//  Algorithm
//
//  Created by 이지수 on 2022/02/07.
//
//
import Foundation

var s = readLine()!.map{ String($0) }
var tag = ""
var mainWord = ""

for char in s {

    if char == "<" {
        tag.append(char)
        if !mainWord.isEmpty {
            print(String(mainWord.reversed()), terminator: "" )
            mainWord = ""
        }
    }else if char == ">" {
            tag.append(char)
            print(tag, terminator: "")
            tag = ""
    }else {
            if tag.first == "<" {
                tag.append(char)
            } else if char == " " {
                print(String(mainWord.reversed()),terminator: " ")
                mainWord = ""
            }else {
                mainWord.append(char)
            }
    }
}

if !mainWord.isEmpty {
    print(String(mainWord.reversed()), terminator: "")
}

//var a = "11"
//var b = "helo"
//
//print(String(a), terminator: "...")
//print(String(b), terminator: "////")
//
