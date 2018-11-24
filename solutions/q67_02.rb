N = 6
FREE, USED, WALL = 0, 1, 9

@memo = {}

def search(seat)
  return @memo[seat] if @memo.has_key?(seat)
  count = 0
  # 搜索鄰座沒有人的座位
  seat.size.times{|i|
    if seat[i] == FREE then
      if (seat[i - 1] != USED) && (seat[i + 1] != USED) then
        # 如果有空著的座位，則坐下，接著進入下一輪搜索
        seat[i] = USED
        count += search(seat)
        seat[i] = FREE
      end
    end
  }
  # 存在鄰座沒有人的座位則採用上述邏輯，剩餘的數目用階乘計算
  @memo[seat] = (count > 0) ? count : (1..seat.count(FREE)).inject(:*)
end

puts search([WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL])
