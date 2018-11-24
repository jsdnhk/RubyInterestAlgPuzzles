# 獲取下一個數字序列
def next_dice(dice)
  right = dice.slice!(0..(dice[0].to_i - 1)).tr('123456','654321')
  dice += right
end

count = 0
(6**6).times{|i|
  # 用六進制數表示的話，只需加上「111111」就變為1～6之間了
  dice = (i.to_s(6).to_i + 111111).to_s
  check = Hash.new
  j = 0

  # 找下一個序列直到進入循環
  while !check.has_key?(dice) do
    check[dice] = j
    dice = next_dice(dice)
    j += 1
  end

  # 定位循環位置，如果在循環範圍外，則計數
  count += 1 if check[dice] > 0
}
puts count
