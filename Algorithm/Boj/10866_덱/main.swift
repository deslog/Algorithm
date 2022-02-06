
/* push_front X: 정수 X를 덱의 앞에 넣는다.
 push_back X: 정수 X를 덱의 뒤에 넣는다.
 pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 덱에 들어있는 정수의 개수를 출력한다.
 empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.
 front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다. */

import Foundation

let n = Int(readLine()!)!
var answer: [String] = []

for _ in 0..<n {
    var order = readLine()!.split(separator: " ").map { String($0) }
    
    switch order[0] {
    case "push_front":
        answer.insert(order[1], at: 0)
    case "push_back":
        answer.append(order[1])
    case "pop_front":
        if answer.isEmpty {
            print(-1)
        }else{
            print(answer.removeFirst())
        }
    case "pop_back":
        if answer.isEmpty {
            print(-1)
        } else {
            print(answer.removeLast())
        }
    case "size":
        print(answer.count)
    case "empty" :
        if answer.isEmpty {
            print(1)
        }else {
            print(0)
        }
    case "front" :
        if answer.isEmpty {
            print(-1)
        } else {
            print(answer[0])
        }
    default:
        if answer.isEmpty {
            print(-1)
        } else{
            print(answer.last!)
        }
    }
}
