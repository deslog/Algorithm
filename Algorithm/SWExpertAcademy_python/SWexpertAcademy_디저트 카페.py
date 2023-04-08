T = int(input())

dx = [1, 1, -1, -1]
dy = [1, -1, -1, 1]

def dfs(depth, x, y, direction):
    global answer
    global sx, sy

    if direction == 3 and x == sx and y == sy:
        answer = max(answer, depth)
        return
    if x < 0 or y < 0 or x >= n or y >= n:
        return
    if graph[x][y] in visited:
        return

    # 방문처리
    visited.append(graph[x][y])
    # 방향이 0라면, 다음 갈 방향은 0이거나 1
    # 방향이 1이라면, 다음 갈 방향은 1이거나 2
    if direction in [0, 1]:
        dfs(depth+1, x+dx[direction], y+dy[direction], direction)
        dfs(depth+1, x+dx[direction+1], y+dy[direction+1], direction+1)

    # 방향이 2이면, 2로 계속 가거나 3으로 가야해
    # 3으로 가기위한 조건은 같은 대각선상에 있어야 3방향으로 꺾을수 있는데 그게 x+y = sx+sy임
    # 꼭 시작점으로 돌아와야하기 때문에 3 방향으로 가는 순간이 정해져잇음
    elif direction == 2:
        if x + y != sx + sy:
            dfs(depth+1, x+dx[2], y+dy[2], 2)
        else:
            dfs(depth+1, x+dx[3], y+dy[3], 3)

    # 방향이 3이라면, 계속 유지해서 3으로 올라감 그러다가 만나면 끝
    else:
        dfs(depth+1, x+dx[3], y+dy[3], 3)

    # 방문처리 해제
    visited.remove(graph[x][y])
    return

for test_case in range(1, T + 1):
    n = int(input())
    graph = []

    for _ in range(n):
        graph.append(list(map(int, input().split())))

    answer = -1
    visited = []

    for i in range(n-1):
        for j in range(1, n-1):
            sx, sy = i, j
            visited.append(graph[i][j])
            dfs(1, i+1, j+1, 0)
            visited.remove(graph[i][j])

    print(f"#{test_case} {answer}")