func solution() {
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = arr[0]
    let m = arr[1]


    func nm(_ values: String, _ count: Int) -> Void {
        if count == m {
            print(values)
        } else {
            for i in 1...n {
                nm(values+"\(i) ", count+1)
            }
        }
    }
    for i in 1...n {
        nm("\(i) ", 1)
    }
}

solution()



