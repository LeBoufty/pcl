def count_paths_in_maze(maze, start, end):
    if start == end:
        return 1
    paths = 0
    x, y = start
    if 0 <= x < len(maze) and 0 <= y < len(maze[0]) and maze[x][y] == 0:
        maze[x][y] = 1
        paths += count_paths_in_maze(maze, (x + 1, y), end)
        paths += count_paths_in_maze(maze, (x - 1, y), end)
        paths += count_paths_in_maze(maze, (x, y + 1), end)
        paths += count_paths_in_maze(maze, (x, y - 1), end)
        maze[x][y] = 0
    return paths


maze = [
    [0, 0, 0, 0],
    [0, 1, 1, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
]
start = (0, 0)
end = (3, 3)
print(count_paths_in_maze(maze, start, end))