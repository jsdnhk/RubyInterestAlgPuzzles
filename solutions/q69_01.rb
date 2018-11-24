# 把終止狀態設置為初始值
memo = {0x000fff => 0, 0xfff000 => 0, 0xcccccc => 0, 0x333333 => 0}
queue = memo.keys
W, H = 4, 6

# 指定可能交換的位置
mask = []
(W * H).times{|i|
  mask.push((1 << 1 | 1) << i) if i % W < W - 1 # 橫向相鄰
  mask.push((1 << W | 1) << i) if i < W * (H - 1) # 縱向相鄰
}

depth = 0
while queue.size > 0 do # 遍歷所有情況
  p [depth, queue.size]
  depth += 1
  next_queue = []
  queue.map{|q|
    mask.each{|m|
      # 除去2個位置「都是0」或者「都是1」的情況以外，遍歷未搜索的部分
      if ((q & m) != 0) && ((q & m) != m) && !memo.key?(q ^ m) then
        memo[q ^ m] = depth
        next_queue.push(q ^ m)
      end
    }
  }
  queue = next_queue
end
