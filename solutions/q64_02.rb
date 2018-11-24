# 6組對手
PAIR = 6

# 設置起始和終止狀態
start = (1..PAIR * 2 - 1).to_a + [0]
goal = [0] + (2..PAIR * 2 - 1).to_a + [1]

# 獲取投接球狀態列表
def throwable(balls)
  result = []
  balls.each{|ball|
    c = ball.index(0)                     # 獲取接球手位置
    p = (c + PAIR) % (PAIR * 2)           # 計算接球手對面位置
    [-1, 0, 1].each{|d|                   # 正對面及其左右
      if (p + d) / PAIR == p / PAIR then
        ball[c], ball[p + d] = ball[p + d], ball[c]
        result.push(ball.clone)           # 設置投球結果
        ball[c], ball[p + d] = ball[p + d], ball[c]
      end
    }
  }
  result
end

# 設定初始狀態
fw = [start]
fw_log = [start]
bw = [goal]
bw_log = [goal]
cnt = 0

# 雙向的廣度優先搜索
while true do
  next_fw = throwable(fw)      # 正向的下一步
  fw = next_fw - fw_log        # 選擇之前沒有出現過的投球方案
  fw_log |= next_fw            # 添加投球結果
  cnt += 1
  break if (fw & bw).size > 0  # 如果狀態相同，則終止處理

  next_bw = throwable(bw)      # 反向的下一步
  bw = next_bw - bw_log        # 選擇之前沒有出現過的投球方案
  bw_log |= next_bw            # 添加投球結果
  cnt += 1
  break if (fw & bw).size > 0  # 如果狀態相同，則終止處理
end
puts cnt
