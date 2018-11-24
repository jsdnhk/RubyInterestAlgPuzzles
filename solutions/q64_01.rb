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
balls = [start]
log = [start]
cnt = 0
# 廣度優先搜索
while !balls.include?(goal) do
  next_balls = throwable(balls)  # 獲取下一步
  balls = next_balls - log       # 選擇之前沒有出現過的投球方案
  log |= next_balls              # 添加投球結果
  cnt += 1
end
puts cnt
