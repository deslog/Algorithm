//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/10/23.
//

import Foundation

struct newsData {
    let newsTitle: String
    let newsCategory: String
}

var data: [newsData] = [
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
    newsData(newsTitle: "버팀목 수출마저 20% ↓…올 무역적자 327억달러", newsCategory: "시사"),
    newsData(newsTitle: "러시아의 화학자 드미트리 멘델레예프…원소를 원자량 순서로 배열해 주기율표 창안", newsCategory: "시사"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
    newsData(newsTitle: "서인 정권의 '향명배금' 정책 고집…국제질서 변화 못읽어 정묘·병자호란 자초", newsCategory: "경제"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "경제"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "경제"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
    newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
    newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역")
]

//var count = 0
//var temp = [newsData]()
//var newData = [newsData]()
//
//for i in 0..<data.count {
//    if count < 5 {
//        if data[i].newsTitle.count >= 30, count + 2 <= 5 {
//            count += 2
//            newData.append(data[i])
//        } else if data[i].newsTitle.count >= 30, count + 2 > 5 {
//            temp.append(data[i])
//        } else if data[i].newsTitle.count < 30 {
//            count += 1
//            newData.append(data[i])
//        }
//    }
//
//    if count == 5 {
//        count = 0
//    }
//}

var long = data.filter { $0.newsTitle.count >= 30 }.map { $0 }
var short = data.filter { $0.newsTitle.count < 30}.map { $0 }

var newdata = [newsData]()
var longCount = long.count
var shortCount = short.count


// MARK: - long <= short * 2 일때만 가능

for _ in 0..<longCount/2 {
    if longCount % 2 == 1 {
        newdata.append(long.removeLast())
        newdata.append(short.removeLast())
        newdata.append(short.removeLast())
        newdata.append(short.removeLast())
    }

    for _ in 0..<2 {
        newdata.append(long.removeLast())
    }

    newdata.append(short.removeLast())
}

for i in short {
    newdata.append(i)
}

print(newdata)
