N = 4
@count = Hash.new(0)

def search()
  # 把各行設置為數值
  (0..(2**N-1)).to_a.repeated_permutation(N).each{|rows|
    # 計算各列○的個數
    col_count = Array.new(N, 0)
    N.times{|c|
      rows.each{|r|
        col_count[c] += 1 if (r & (1 << c) > 0)
      }
    }
    # 計算各行○的個數
    row_count = rows.map{|r| r.to_s(2).count("1")}
    # 用哈希表記錄行和列組合的出現次數
    @count[row_count + col_count] += 1
  }
end

search()
# 輸出只出現一次的組合
puts @count.select{|k, v| v == 1}.count
