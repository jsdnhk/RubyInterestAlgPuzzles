MAX = 500

answer = []
(1..MAX/4).each{|c|           # 正方形邊長
  edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}
  edge.combination(2){|a, b|  # 長方形面積
    if a + b == c * c then
      answer.push([1, b / a.to_f, c * c / a.to_f])
    end
  }
}
answer.uniq!                  # 去除整數倍的情況
puts answer.size
