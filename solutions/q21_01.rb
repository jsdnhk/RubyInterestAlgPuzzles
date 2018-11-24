count = 0     # 「0」出現的次數
line = 1      # 當前行的行數
row = [1]     # 當前行的值

while count < 2014 do
  next_row = [1]
  # 通過上一行計算異或得到下一行
  (row.size - 1).times{|i|
    cell = row[i] ^ row[i + 1]
    next_row.push(cell)
    count += 1 if cell == 0  # 統計「0」出現的次數
  }
  next_row.push(1)
  line += 1                  # 增加行數，進入下一行處理
  row = next_row
end

puts line        # 統計到2014個「0」時的行
