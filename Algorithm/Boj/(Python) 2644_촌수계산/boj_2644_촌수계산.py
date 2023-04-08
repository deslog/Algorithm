total = int(input())
a, b = map(int, input().split())
connection = int(input())
visited = [False] * (total+1)
answer = []
graph = [[] for _ in range(total+1)]

for _ in range(0, connection):
    i, j = map(int, input().split())
    graph[i].append(j)
    graph[j].append(i)

def dfs(start, depth):
    visited[start] = True

    if start == b:
        answer.append(depth)

    for i in graph[start]:
        if not visited[i]:
            dfs(i, depth+1)

dfs(a, 0)
if len(answer) != 0:
    print(answer[0])
else:
    print(-1)