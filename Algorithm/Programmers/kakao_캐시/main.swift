//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/09.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {

    let newCitiies = cities.map {
        return $0.lowercased()
    }

    var cacheArray = [String]()
    var totalTime = 0

    for city in newCitiies {
        // cache hit
        if cacheArray.contains(city) {
            totalTime += 1
            cacheArray.remove(at: cacheArray.firstIndex(of: city)!)
            cacheArray.append(city)
        } else { // cache miss
            totalTime += 5
            cacheArray.append(city)
            if cacheArray.count > cacheSize {
                cacheArray.removeFirst()
            }
        }
    }
    return totalTime
}
