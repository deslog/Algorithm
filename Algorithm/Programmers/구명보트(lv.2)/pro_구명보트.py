def solution(people, limit):
    answer = 0
    start = 0
    end = len(people) - 1
    people.sort()
    
    while start <= end:
        answer += 1
        if people[start] + people[end] <= limit:
            start += 1
        end -= 1
    
    return answer
