N = 7
checked = {(1..N).to_a => 0} # 已檢查的數組
check = [(1..N).to_a]        # 檢查目標
depth = 0                    # 交換次數

while check.size > 0 do      # 如果存在檢查目標，則循環
  next_check = []
  (0..(N-1)).to_a.combination(2){|i, j|  # 選擇兩個數字交換
    check.each{|c|
      d = c.clone
      d[i], d[j] = d[j], d[i]
      if !checked.has_key?(d) then
        checked[d] = depth + 1
        next_check << d
      end
    }
  }
  check = next_check
  depth += 1
end

puts checked.values.inject(:+)
