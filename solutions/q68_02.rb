﻿W, H = 5, 6
ALL = (1 << W) - 1
# 保存各行男生人數
@boys = (0..ALL).map{|i| i.to_s(2).count("1")}

# 第3行座次能否安排（從上2行能否繼續安排）
def check(r1, r2, r3)
  result = true
  W.times{|i|                      # 確定1行的各個位置
    m1 = (0b111 << (i - 1)) & ALL  # 檢查左右是否並列
    m2 = 1 << i                    # 檢查上下是否並列
    if (r1 & m2 == m2) && (r2 & m1 == m1) && (r3 & m2 == m2) then
      result = false               # 如果都是男生並列，則不符合要求
    end
    if ((r1 ^ ALL) & m2 == m2) && ((r2 ^ ALL) & m1 == m1) &&
       ((r3 ^ ALL) & m2 == m2) then
      result = false               # 如果都是女生並列，則不符合要求
    end
  }
  result
end

# 生成從上2行繼續的行的哈希表
@next = {}
(1 << W).times{|r1|       # 第1行
  (1 << W).times{|r2|     # 第1行
    @next[[r1, r2]] = (0..ALL).select{|r3| check(r1, r2, r3)}
  }
}

@memo = {}
def search(pre1, pre2, line, used)
  if @memo.has_key?([pre1, pre2, line, used]) then
    return @memo[[pre1, pre2, line, used]] # 曾經搜索過
  end

  if line >= H then                        # 搜索到最後一行
    @memo[[pre1, pre2, line, used]] = (used == W*H/2)?1:0
    return @memo[[pre1, pre2, line, used]]
  end
  result = 0
  if line == H - 1 then                    # 倒數第2行
    @next[[pre2, pre1]].each{|row|
      if (@next[[row, row]].include?(pre1)) &&
        (used + @boys[row] <= W * H / 2) then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  else                                     # 最後一行以外
    @next[[pre2, pre1]].each{|row|
      if used + @boys[row] <= W * H / 2 then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  end
  @memo[[pre1, pre2, line, used]] = result
end

count = 0
(1 << W).times{|r0|                        # 設置最初一行
  count += search(r0, r0, 1, @boys[r0])
}
puts count
