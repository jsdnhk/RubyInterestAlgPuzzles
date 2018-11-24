N = 5
# 右手法則的移動方向（按右、上、左、下的順序）
@dx = [[1, 0], [0, -1], [-1, 0], [0, 1]]

# maze: 牆壁設置
# p1, d1: 第1個人走過的路徑和移動方向
# p2, d2: 第2個人走過的路徑和移動方向
def search(maze, p1, d1, p2, d2)
    if p1.size == p2.size then # 兩人同時移動的情況
        # 兩人相遇則成功
        return true if p1[-1][0..1] == p2[01][0..1]
        # 第1個人到達右下方則失敗
        return false if p1[-1][0..1] == [N - 1, N - 1]
        # 第2個人到達左上方則失敗
        return false if p2[-1][0..1] == [0, 0]
    end
    # 兩人往同一個方向移動則移動方向形成環，失敗
    return false if p1.count(p1[-1]) > 1

    pre = p1[-1]
    @dx.size.times{|i| # 搜索右手法則指定的方向
        d = (d1 - 1 + i) % @dx.size
        px = pre[0] + @dx[d][0]
        py = pre[1] + @dx[d][1]
        # 判斷移動前方是否是牆壁
        if (px >= 0) && (px < N) && (py >= 0) && (py < N) && (maze[px + N * py] == 0) then
            return search(maze, p2, d2, p1 + [[px, py, d]], d)
            break
        end
    }
    false
end

a = [[0, 0, -1]]            # A: 左上角（X坐標，Y坐標、向前的移動方向）
b = [[N - 1, N - 1, -1]]    # B: 右下角（X坐標，Y坐標、向前的移動方向）
cnt = 0
[0, 1].repeated_permutation(N * N - 2){|maze|
    # 兩人的起始位置一定作為路徑的一部分檢索
    # A向下移動（@dx[3]）、B向上移動（@dx[1]）
    cnt += 1 if search([0] + maze + [0], a, 3, b, 1)
}
puts cnt
