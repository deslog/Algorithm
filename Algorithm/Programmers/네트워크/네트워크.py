# 2023.02.23

def solution(n, computers):

    visited = [False] * (n)
    answer = 0

    # dfs 함수
    def dfs(computerNumber):
        visited[computerNumber] = True

        for i in range(n):
            if i != computerNumber and computers[computerNumber][i] == 1:
                if visited[i] == False:
                    dfs(i)

    # 컴퓨터 하나씩 start 지점으로 다 방문해야함
    for computerNumber in range(n):
        if visited[computerNumber] == False:
            dfs(computerNumber)
            answer += 1
    return answer
