count = 0     # 「0」出現的次數
line = 1      # 當前行的行數
row = 1       # 當前行的值（二進制碼）

while count < 2014 do
  row ^= row << 1     # 從前一行做異或運算得到下一行
  count += row.to_s(2).count("0")    # 統計「0」出現的次數
  line += 1
end

puts line        # 統計到2014個「0」時的行
