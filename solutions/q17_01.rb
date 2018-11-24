# 用字符表示男女
@boy, @girl = "B", "G"
N = 30

def add(seq)
  # 到達排列人數上限，終止遞歸
  return 1 if seq.size == N

  # 未滿30人時，加男生，當右邊為男生時加女生
  cnt = add(seq + @boy)
  cnt += add(seq + @girl) if seq[-1] == @boy
  return cnt
end

# 從男生或者女生開始
puts add(@boy) + add(@girl)
