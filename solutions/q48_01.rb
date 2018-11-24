N = 8                     # 各色卡片數目
start = (1 << N) - 1      # 開始狀態(0N個，1N個)
mask = (1 << N * 2) - 1   # 掩碼

# 目標狀態（0和1交錯排列）
goal1 = 0
N.times{|i| goal1 = (goal1 << 2) + 1}
goal2 = mask - goal1

# 反轉次數
count = N * 2
(1 << N*2).times{|i|   # 表示開始反轉位置的比特列
  turn = i ^ (i << 1) ^ (i << 2)
  turn = (turn ^ (turn >> (N * 2))) & mask

  # 到達目標狀態後找出反轉位置數字的最小值
  if (start ^ turn == goal1) || (start ^ turn == goal2) then
    count = [count, i.to_s(2).count('1')].min
  end
}
puts count
