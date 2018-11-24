# 獲取下一個數字序列
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

count = 0
(6**6).times{|i|
  check = Array.new

  # 找下一個序列直到進入循環
  while !check.include?(i) do
    check << i
    i = next_dice(i)
  end

  # 定位循環位置，如果在循環範圍外，則計數
  count += 1 if check.index(i) != 0
}
puts count
