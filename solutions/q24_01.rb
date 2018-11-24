# 列舉能一次擊落的2個靶子的組合
board = [[1, 2], [2, 3], [7, 8], [8, 9],
         [1, 4], [3, 6], [4, 7], [6, 9]]
# 增加逐個擊落的方法
1.upto(9){|i|
  board.push([i])
}

@memo = {[] => 1}
def strike(board)
  # 如果已經全部遍歷完，則輸出這個值
  return @memo[board] if @memo.has_key?(board)
  cnt = 0
  board.each{|b|
    # 排除含有已經擊落數字的組合
    next_board = board.select{|i| (b & i).size == 0}
    cnt += strike(next_board)
  }
  @memo[board] = cnt
end

puts strike(board)
