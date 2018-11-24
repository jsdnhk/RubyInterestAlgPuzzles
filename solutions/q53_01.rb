N = 11
cards = [0] * N * 2      # 紙牌初始值
@count = 0

def search(cards, num)
  if num == N + 1 then   # 放置到最後時處理成功
    @count += 1
  else
    # 檢查是否能放置，按順序處理
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        # 能放置的話就放置紙牌，遞歸搜索下一步
        cards[i], cards[i + num + 1] = num, num
        search(cards, num + 1)
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, 1)         # 最開始放置標記為「1」的紙牌
puts @count
