# 豎線和橫線
v, h = 7, 10
total = 0
# 對所有「下方的數字」排列，計算橫線數目
(1..v).to_a.permutation.each{|final|
  start = (1..v).to_a
  cnt = 0
  v.times{|i|
    # 找出對應「上方的數字」的位置
    move = start.index(final[i])
    if move > 0 then
      # 更換「上方的數字」
      start[i], start[move] = start[move], start[i]
      cnt += move - i
    end
  }
  total += 1 if cnt == h
}
puts total
