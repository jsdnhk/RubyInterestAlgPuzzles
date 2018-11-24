W, H = 10, 10
# 設置停車場狀態（用數字「9」作為邊界）
parking = Array.new(W + 2){Array.new(H + 2){1}}
(W + 2).times{|w|
  parking[w][0] = parking[w][H + 1] = 9
}
(H + 2).times{|h|
  parking[0][h] = parking[W + 1][h] = 9
}

# 目標是左上角車的狀態
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

# 開始位置是右下角的狀態
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
  target = []
  prev.each{|parking, w, h|
    # 上下左右移動
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|dw, dh|
      nw, nh = w + dw, h + dh
      if (parking[nw][nh] != 9) then
        # 如果是邊界以外的情況，則檢查是否已經遍歷
        temp = Marshal.load(Marshal.dump(parking))
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        if !@log.has_key?([temp, nw, nh]) then
          # 把未遍歷的位置作為遍歷目標
          target.push([temp, nw, nh])
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    }
  }
  return if target.include?([@goal, W, H])
  # 廣度優先搜索
  search(target, depth + 1) if target.size > 0
end

# 記錄已搜索部分
@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0
# 從開始位置開始搜索
search([[start, W, H - 1], [start, W - 1, H]], 0)
# 輸出到達目標的搜索次數
puts @log[[@goal, W, H]]
