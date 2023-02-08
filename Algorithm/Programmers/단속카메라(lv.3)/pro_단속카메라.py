def solution(routes):
    routesLen = len(routes)
    routes.sort(key = lambda x: x[1])
    camera = [routes[0][1]]
    
    for i in range(1, routesLen):
        if routes[i][0] <= camera[-1] <= routes[i][1]:
            continue
        else:
            camera.append(routes[i][1])
    return len(camera)
