# 獲取下一個數字序列
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

# 記錄已檢索的值（0:未檢索，1:循環外，2:循環內）
all_dice = Array.new(6 ** 6, 0)
(6**6).times{|i|
  if all_dice[i] == 0 then
    check = Array.new
    while (all_dice[i] == 0) && (!check.include?(i)) do
      check << i
      i = next_dice(i)
    end
    index = check.index(i)
    if (index) then # 循環發生點，這個位置前是循環外
      check.shift(index).each{|j| all_dice[j] = 1}
      check.each{|j| all_dice[j] = 2}
    else # 包含已檢索值時為循環外
      check.each{|j| all_dice[j] = 1}
    end
  end
}
puts all_dice.count(1)
