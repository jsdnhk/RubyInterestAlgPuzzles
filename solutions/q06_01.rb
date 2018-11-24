# 檢測是否形成環
def is_loop(n)
  # 最開始乘以3加1
  check = n * 3 + 1
  # 一直循環到數字變為1
  while check != 1 do
    check = check.even? ? check / 2 : check * 3 + 1
    return true if check == n
  end
  return false
end

# 檢查2～10000之間的所有偶數
puts 2.step(10000, 2).count{|i|
  is_loop(i)
}
