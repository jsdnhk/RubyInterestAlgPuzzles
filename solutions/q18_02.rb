def check(last_n, used, list)
  # 已經全部使用，如果和最初的「1」相加能得到平方數，則結束遞歸
  return [1] if used.all? && (list[1].include?(last_n))
  list[last_n].each{|i|           # 逐一嘗試候補數字
    if used[i - 1] == false then  # 沒有全部使用的情況
      used[i - 1] = true
      result = check(i, used, list)
      # 找到的時候，添加這個值
      return [i] + result if result.size > 0
      used[i - 1] = false
    end
  }
  []
end

n = 2
while true do
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  # 找到可以作為相鄰數字的候補數字
  list = {}
  (1..n).each{|i|
    list[i] = square.map{|s| s - i}.select{|s| s > 0}
  }
  # 把「1」設置為已使用，從「1」開始搜索
  result = check(1, [true] + [false] * (n - 1), list)
  break if result.size > 0
  n += 1
end
puts n
p result
