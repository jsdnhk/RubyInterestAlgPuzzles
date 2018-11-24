# 設置圖塊數目
W, H = 4, 3
# 按位反轉用的值
XOR_ROW = (1 << (W + 1)) - 1

# 按行搜索
def search(up, y, odds)
  # 截至上一行，如果奇數頂點的數目大於2，則排除這種情況
  return 0 if 2 < odds

  row = 1 << W | 1     # 設置初始值

  # 翻轉最初和最後的行
  row = XOR_ROW ^ row if (y == 0) || (y == H)

  if y == H then       # 如果是最後一行，則檢查後結束
    odds += (row ^ up).to_s(2).count("1")   # 計算奇數個數
    return 1 if (odds == 0) || (odds == 2)  # 如果為0或者2，則計入結果
    return 0
  end
  cnt = 0
  (1 << W).times{|a|   # 圖塊內容（有無左上至右下的線條）
    (1 << W).times{|b| # 圖塊內容（有無左下至右上的線條）
      cnt += search(a ^ b << 1, y + 1,
                    odds + (row ^ up ^ a << 1 ^ b).to_s(2).count("1"))
    }
  }
  return cnt
end

puts search(0, 0, 0)
