N = 8 # 沙漏數目
GOAL = [1] * N # 如果所有沙漏剩餘砂量為1，則所有砂子能同時落下

count = 0
(1..N).to_a.permutation{|init| # 順次設置初始狀態
  hourglass = init
  pos = 0
  log = {} # 用於檢查是否變為同樣狀態的記錄
  while log[hourglass] != pos  # 如果變為過去的同樣狀態，則終止處理
    if hourglass == GOAL then  # 如果變為目標狀態，則處理結束
      count += 1
      break
    end
    log[hourglass] = pos

    # 減少沙漏砂量（如果上側砂量為0，則保持為0）
    hourglass = hourglass.map{|h| h > 0 ? h - 1 : 0}
    init[pos].times{|i|        # 反轉沙漏
      rev = (pos + i) % N
      hourglass[rev] = init[rev] - hourglass[rev]
    }
    pos = (pos + 1) % N        # 移動到下一個位置
  end
}

puts count
