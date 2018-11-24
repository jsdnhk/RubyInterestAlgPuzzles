# 長方形大小
W, H = 5, 4
@width, @height = W + 2, H + 2

NONE, BLUE, WHITE, WALL = 0, 1, 2, 9

map = Array.new(@width * @height, 0)
# 設置外邊界
@width.times{|i|
  map[i] = WALL
  map[i + @width * (@height - 1)] = WALL
}
@height.times{|i|
  map[i * @width] = WALL
  map[(i + 1) * @width - 1] = WALL
}

# 從(1,1)開始
map[@width + 1] = BLUE
@maps = {map => false}

# 採用廣度優先遞歸地對格子塗色
def fill(depth, color)
  return if depth == 0
  new_maps = {}
  W.times{|w|
    H.times{|h|
      pos = w + 1 + (h + 1) * @width
      @maps.each{|k, v|
        check = false
        if k[pos] == 0 then
          [1, -1, @width, -@width].each{|d|
            check = true if k[pos + d] == color
          }
        end
        if check then
          m = k.clone
          m[pos] = color
          new_maps[m] = false
        end
      }
    }
  }
  @maps = new_maps
  fill(depth - 1, color)
end

# 把一半方格塗成藍色
fill(W * H / 2 - 1, BLUE)

# 把白色塗進空著的方格上
new_maps = {}
@maps.each{|k, v|
  pos = k.index(NONE)
  m = k.clone
  m[pos] = WHITE
  new_maps[m] = false
}
@maps = new_maps

# 塗上白色
fill(W * H / 2 - 1, WHITE)

# 統計所有方格全部上色完畢的組合
count = 0
@maps.each{|m|
  count += 1 if !(m.include?(NONE))
}
puts count
