W, H = 6, 4
DIR = [[0, 1], [-1, 0], [0, -1], [1, 0]] # 前進方向
left = [0] * H   # 用二進製表示某根豎線是否已通過
bottom = [0] * W # 用二進製表示某根橫線是否已通過

def search(x, y, dir, left, bottom)
  left_l = left.clone
  bottom_l = bottom.clone
  # 已經越界或者已通過的情況下無法前行
  if (dir == 0) || (dir == 2) then # 前後移動的情況
    pos = [y, y + DIR[dir][1]].min
    return 0 if (pos < 0) || (y + DIR[dir][1] > H)
    return 0 if left_l[pos] & (1 << x) > 0
    left_l[pos] |= (1 << x)        # 把豎線標記為已通過
  else                             # 左右移動的情況
    pos = [x, x + DIR[dir][0]].min
    return 0 if (pos < 0) || (x + DIR[dir][0] > W)
    return 0 if bottom_l[pos] & (1 << y) > 0
    bottom_l[pos] |= (1 << y)      # 把橫線標記為已通過
  end
  next_x, next_y = x + DIR[dir][0], y + DIR[dir][1]
  return 1 if (next_x == W) && (next_y == H)  # 到達B點則結束

  cnt = 0
  # 前進
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  # 左轉
  dir = (dir + 1) % DIR.size
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  cnt
end

puts search(0, 0, 3, left, bottom) # 從起點右轉開始
