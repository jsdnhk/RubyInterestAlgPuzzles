N = 5
MASK = (1 << (N * N)) - 1
# 利用位運算計算已經移動的位置
@move = [lambda{|m| (m >> 1) & 0b0111101111011110111101111},
         lambda{|m| (m << N) & MASK},
         lambda{|m| (m << 1) & 0b1111011110111101111011110},
         lambda{|m| m >> N}]

# 判斷有效路徑
def enable(maze)
    man = (1 << (N * N - 1)) & (MASK - maze)    # 從左上角出發
    while true do
        next_man = man
        @move.each{|m| next_man |= m.call(man)} # 上下左右移動
        next_man &= (MASK - maze)               # 可以移動到牆壁以外的方格
        return true if next_man & 1 == 1        # 到達右下角有效
        break if man == next_man
        man = next_man
    end
    false
end

# maze: 牆壁設置
# p1, d1: 第1個人走過的路徑和移動方向
# p2, d2: 第2個人走過的路徑和移動方向
def search(maze, p1, d1, p2, d2, turn)
    if true then
        return true if p1 == p2 # 兩人相遇
        # 其中一人到達目標
        return false if (p1 == 1) || (p2 == 1 << (N * N - 1))
    end
    @move.size.times{|i| # 搜索右手法則指定的方向
        d = (d1 - 1 + i) % @move.size
        if @move[d].call(p1) & (MASK - maze) > 0 then
            return search(maze, p2, d2, @move[d].call(p1), d, !turn)
        end
    }
    false
end

cnt = 0
(1 << N * N).times{|maze|
    if enable(maze) then
        man_a, man_b = 1 << (N * N - 1), 1
        cnt += 1 if search(maze, man_a, 3, man_b, 1, true)
    end
}
puts cnt
