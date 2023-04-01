# 2606 바이러스
from collections import  deque

computerCnt = int(input())
connection = int(input())

network = [[] for _ in range(computerCnt+1)]

for _ in range(connection):
    a, b = map(int, input().split())
    network[a].append(b)
    network[b].append(a)

def bfs(x):
    visited = [False] * (computerCnt + 1)
    visited[1] = True
    q = deque([1])
    answer = 0

    while q:
        x = q.popleft()
        for nx in network[x]:
            if not visited[nx]:
                answer += 1
                q.append(nx)
                visited[nx] = True
    return answer

print(bfs(1))