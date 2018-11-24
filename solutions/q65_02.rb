# 設置圖塊數目
W, H = 4, 3
row = [0] + [1] * (W - 1) + [0]
@edge = row + row.map{|r| 1 - r} * (H - 1) + row

def search(panel, odds)
  # 截至最後一個圖塊，奇數頂點是否超過2個
  return (@edge.inject(:+) > 2)?0:1 if panel >= (W + 1) * H
  # 途中奇數點2個超一筆書不可
  # 如果中途奇數頂點超過2個，則不可能完成一筆畫
  return 0 if odds > 2

  cnt = 0
  if panel % (W + 1) < W then   # 到達行的最右側
    # 遍歷圖塊內沒有斜線的情況
    cnt += search(panel + 1, odds + @edge[panel])

    # 圖塊有從左上到右下的線
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 圖塊有交叉線
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
    cnt += search(panel + 1, odds + @edge[panel])

    # 圖塊有從右上到左下的線
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 斜線回到原點
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
  else               # 到達行右端時，進入下一行
    cnt += search(panel + 1, odds + @edge[panel])
  end
  cnt
end

puts search(0, 0)
