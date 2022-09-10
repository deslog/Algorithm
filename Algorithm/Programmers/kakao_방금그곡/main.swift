//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2022/09/10.
//

import Foundation

let m = "CC#BCC#BCC#BCC#B"
let musicinfos = ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]

func divideMusicinfos(_ music: [String]) -> [[String]] {
    var newMusicinfos = [[String]]()
    for i in 0..<music.count {
        let tempCode = music[i].split(separator: ",").map{ String($0) }
        newMusicinfos.append(tempCode)
    }
    return newMusicinfos
}

func makeNewCode(_ code: String) -> String {
        let newCode = code.replacingOccurrences(of: "C#", with: "V")
            .replacingOccurrences(of: "D#", with: "W")
            .replacingOccurrences(of: "F#", with: "X")
            .replacingOccurrences(of: "G#", with: "Y")
            .replacingOccurrences(of: "A#", with: "Z")
    return newCode
}

func makeTimeDiff(_ startTime: String, _ endTime: String) -> Int {
    let start = startTime.split(separator: ":").map{ Int(String($0))! }
    let end = endTime.split(separator: ":").map{ Int(String($0))! }

    return (60 * end[0] + end[1]) - (60 * start[0] + start[1])
}

func makeRunCode(_ timeDiff: Int, _ code: String) -> String {
    var runCode = ""
    let code = makeNewCode(code).map { String($0) }

    // 분당 코드 하나라서 하나씩 넣어줘야함.
    for i in 0..<timeDiff {
        runCode += code[i % code.count]
    }
    return runCode
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let newM = makeNewCode(m)
    let newMusicinfos = divideMusicinfos(musicinfos)
    var maxDiff = -9999
    var result = "(None)"

    for music in newMusicinfos { // music : [String]
        let title = music[2]
        let timeDiff = makeTimeDiff(music[0], music[1])
        let runCode = makeRunCode(timeDiff, music[3])

        if runCode.contains(newM) {
            // 초반에는 무조건 진입해서 maxDiff 갱신
            // 그 이후에는 maxDiff가 더 클 경우에만 진입
            // 같으면 갱신할 필요없이 그냥 초반 노래 출력하면 되니까 따로 조건 처리 필요 없음
            if maxDiff < timeDiff {
                maxDiff = timeDiff
                result = title
            }
        }
    }
    return result
}

print(solution(m, musicinfos))
