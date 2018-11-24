def check(n, pre, log, square)
  if n == log.size then
    # 全部放置結束
    if square.include?(1 + pre) then
      # 1和最後一個數之和為平方數時
      puts n
      p log
      return true # 只要找到1種解法就結束
    end
  else
    ((1..n).to_a - log).each{|i| # 遍歷沒有被使用的數字
      if square.include?(pre + i) then
        # 如果和前一個數之和為平方數
        return true if check(n, i, log + [i], square)
      end
    }
  end
  false
end

n = 2
while true do
  # 事先計算平方數（最大值為n的2倍）
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end
