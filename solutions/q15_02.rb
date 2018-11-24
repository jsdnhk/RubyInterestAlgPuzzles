N = 10      # 樓梯級數
STEPS = 4   # 一次最大前進級數

@memo = {}

def move(a, b)
  return @memo[[a,b]] if @memo.has_key?([a, b])
  return @memo[[a,b]] = 0 if a > b   # 如果A級數比B大，則結束搜索
  return @memo[[a, b]] = 1 if a == b # 如果停在同一級，則算入結果
  cnt = 0
  (1..STEPS).each{|da|
    (1..STEPS).each{|db|
      cnt += move(a + da, b - db) # 遞歸搜索
    }
  }
  @memo[[a, b]] = cnt
end

# A從0位置開始，B從N位置開始
puts move(0, N)
