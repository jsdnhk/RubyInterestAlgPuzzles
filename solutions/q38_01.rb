# 設置反轉用的掩碼
mask = Array.new(16)
4.times{|row|
  4.times{|col|
    mask[row * 4 + col] =
      (0b1111 << (row * 4)) | (0b1000100010001 << col)
  }
}

max = 0
# 保存步驟數目的數組
steps = Array.new(1 << 16, -1)
# 從所有方格都為白色開始
steps[0] = 0
# 檢查對象的數組
scanner = [0]
while scanner.size > 0 do
  check = scanner.shift
  next_steps = steps[check] + 1
  16.times{|i|
    n = check ^ mask[i]
    # 如果未檢查過，則進一步檢索
    if steps[n] == -1 then
      steps[n] = next_steps
      scanner.push(n)
      max = next_steps if max < next_steps
    end
  }
end

puts max # 最大步驟數
puts steps.index(max).to_s(2) # 初始狀態的方格：全部黑色
p steps.select{|i| i == -1} # 不存在不能全部變為白色的初始狀態
