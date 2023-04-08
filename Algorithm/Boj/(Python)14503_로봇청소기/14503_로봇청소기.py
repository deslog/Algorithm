n, m = map(int, input().split())
r, c, d = map(int, input().split())
graph = []
for _ in range(n):
    graph.append(list(map(int, input().split())))

dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

# 일단 시작점은 청소하고 시작,
# 벽은 1이라서 후진이 안되는데, 청소한지점이라면 2로 두고 지나갈수는 있게 해주자
visited = [[False] * m for _ in range(n)]
visited[r][c] = True
cnt = 1

while True:
    flag = 0
    for _ in range(4):
        d = (d + 3) % 4 # 이렇게 해야 0321 순서로 조회됨
        nr = r + dx[d]
        nc = c + dy[d]

        # 범위내, 청소가능하다면 전진
        if 0 <= nr < n and 0 <= nc < m and graph[nr][nc] == 0:
            if not visited[nr][nc]:
                visited[nr][nc] = True
                r = nr
                c = nc
                flag = 1
                cnt += 1
                break # 왼쪽으로 한칸이라도 돌아갔을때 청소를 했다면 break 해줘야함 ;;

    # flag가 그대로 0이면, 네 방향중 청소할 수 있는데가 없다는 뜻 -> 그럼? 후진해줘
    # 후진을 할 수없는 벽이라면, 탈출
    if flag == 0:
        # (현재 방향 +2) % 4 -> 뒤로가는 방향임
        nd = (d + 2) % 4
        if graph[r+dx[nd]][c+dy[nd]] == 1:
            print(cnt)
            break
        else:
            r = r + dx[nd]
            c = c + dy[nd]
