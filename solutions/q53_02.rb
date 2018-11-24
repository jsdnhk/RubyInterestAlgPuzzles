N = 11
cards = [0] * N * 2
@count = 0

def search(cards, num)
  if num == 0 then        # 把終止判定改為0
    @count += 1
  else
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        cards[i], cards[i + num + 1] = num, num
        search(cards, num - 1)  # 因為從較大的開始，所以這裡是減法
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, N)          # 從最大的紙牌開始
puts @count
