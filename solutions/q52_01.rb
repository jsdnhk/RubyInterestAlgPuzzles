M, N = 6, 5   # 設置「糖果包裝紙」和「糖果本身」的數目
@memo = {}    # 內存化所用的哈希表

def search(candy, color)
  return 1 if candy == [0] * N          # 所有糖果都包好了
  # 如果存在內存化的結果，則使用
  return @memo[candy + [color]] if @memo.has_key?(candy + [color])

  # 統計包裝紙和糖果口味不一致的組合
  cnt = 0
  candy.size.times{|i|
    if i != (color % candy.size) then   # 不一致的情況
      if candy[i] > 0 then              # 還剩下糖果的情況
        candy[i] -= 1
        cnt += search(candy, color + 1) # 進入下一層搜索
        candy[i] += 1
      end
    end
  }
  @memo[candy + [color]] = cnt   # 把糖果的數目和顏色保存起來
end
puts search([M] * N, 0)
