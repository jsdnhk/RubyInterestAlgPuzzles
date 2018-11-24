N = 10      # 樓梯級數
STEPS = 4   # 一次最大前進級數

dp = Array.new(N + 1, 0)     # 統計t次移動後的位置
cnt = 0
dp[N] = 1                    # 設置初始值

N.times{|i|                  # 移動次數(最大N)
  (N + 1).times{|j|          # 移動的位置
    (1..STEPS).each{|k|
      break if k > j
      dp[j - k] += dp[j]
    }
    dp[j] = 0                # 清除移動位置
  }
  cnt += dp[0] if i % 2 == 1 # 經過偶數次移動到達相反位置
}
puts cnt
