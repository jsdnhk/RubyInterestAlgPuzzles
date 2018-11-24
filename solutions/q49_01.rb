W, H = 6, 5                 # 橫向和縱向的方格數目
USABLE = 2                  # 同一條直線可以使用的次數
@max = 0                    # 最長距離
@h = Array.new(H + 1, 0)    # 保存水平方向線的使用次數
@v = Array.new(W + 1, 0)    # 保存垂直方向線的使用次數

def search(x, y)
  if (x == W) && (y == H) then # 如果到達了B點，則確認最大值，終止搜索
    @max = [@h.inject(:+) + @v.inject(:+), @max].max
    return
  end
  if @h[y] < USABLE then    # 可以水平方向移動的時候
    if x > 0 then           # 向左移動
      @h[y] += 1
      search(x - 1, y)
      @h[y] -= 1
    end
    if x < W then           # 向右移動
      @h[y] += 1
      search(x + 1, y)
      @h[y] -= 1
    end
  end
  if @v[x] < USABLE then    # 可以垂直方向移動的時候
    if y > 0 then           # 向上移動
      @v[x] += 1
      search(x, y - 1)
      @v[x] -= 1
    end
    if y < H then           # 向下移動
      @v[x] += 1
      search(x, y + 1)
      @v[x] -= 1
    end
  end
end

search(0, 0)                # 從A位置開始
puts @max
