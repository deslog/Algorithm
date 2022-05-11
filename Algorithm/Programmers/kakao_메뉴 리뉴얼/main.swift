import Foundation

//result = ["AC", "ACDE", "BCFG", "CDE"]
var orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
var course = [2,3,4]

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var set = [String: Int]()
    
    func dfs(index: Int, origin: [Character], newString: String) {
        if course.last! < newString.count{
            return
        }
        
        if course.contains(newString.count) {
            if set.keys.contains(newString) {
                set[newString]! += 1
            } else {
                set[newString] = 1
            }
        }
        
        for i in index..<origin.count {
            let c = origin[i]
            dfs(index: i+1, origin:  origin, newString: "\(newString)\(c)")
        }
    }
    
    // 탐색시작
    for order in orders {
        let order = order.sorted()
        dfs(index: 0, origin: order, newString: "")
//        print("order = \(order), set = \(set)")
//        print("----------------------")
    }
    // 조합중 2번이상 선택받은 메뉴만 가능
    // 최대값이 같으면 모두포함
    var result = [String]()
    
    for length in course {
        let temp = set.filter { $0.key.count == length && $0.value > 1 }
        let maxNum = temp.max { $0.value < $1.value }
        let menu = temp.filter { maxNum!.value == $0.value }.map { $0.key }
        result.append(contentsOf: menu)
    }
    return result.sorted()
    
}

print(solution(orders, course))
