n = 14
# 設置初始狀態人數(a, b, c的人數+教師通話次數)
status = [[n, 0, 0, 0]]
step = 0 # 經過時間
while status.select{|s| s[1] == n}.size == 0 do
  # 循環處理，直到不必通話的學生(b)人數變為總人數
  next_status = []
  status.each{|s|
    (s[1] + 1).times{|b|
      # 不必通話的學生聯繫其他學生的人數
      (s[2] + 1).times{|c|
        # 需要通話的學生聯繫的人數
        if s[2] > 0 then # 有可通話學生的時候
          # 有學生聯繫教師
          if s[0]-b-c+1 >= 0 then
            next_status << [s[0]-b-c+1, s[1]+c, s[2]+b-1, s[3]+1]
          end
        end
        # 沒有學生聯繫教師
        if s[0]-b-c >= 0 then
          next_status << [s[0]-b-c, s[1]+c, s[2]+b, s[3]]
        end
        # 教師聯繫了學生
        if s[0]-b-c-1 >= 0 then
          next_status << [s[0]-b-c-1, s[1]+c+1, s[2]+b, s[3]+1]
        end
      }
    }
  }
  status = (next_status - status).uniq
  step += 1
end
# 打印經過時間
puts step
# 打印在最短時間的情況中，教師通話次數最少的情況
p status.select{|s| s[1] == n}.min{|a, b| a[3] <=> b[3]}
