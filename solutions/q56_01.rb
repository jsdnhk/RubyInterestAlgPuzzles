# 豎線和橫線
v, h = 7, 10
total = 0
# 對「下方的數字」，統計需要交換位置的數字
(0..(v-1)).to_a.permutation.each{|final|
  cnt = 0
  v.times{|i|
    cnt += final.take_while{|j| j != i}.count{|k| k > i}
  }
  total += 1 if cnt == h
}
puts total
