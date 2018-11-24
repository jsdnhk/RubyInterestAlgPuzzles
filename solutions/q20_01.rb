# 把魔方陣保存到數組
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]

# 統計用哈希表
sum = Hash.new(0)
1.upto(magic_square.size){|i|
  # 對組合進行全量檢索
  magic_square.combination(i){|set|
    # 把組合的和值統計保存到哈希表
    sum[set.inject(:+)] += 1
  }
}

# 輸出出現次數最多的和值
puts sum.max{|x, y| x[1] <=> y[1]}
