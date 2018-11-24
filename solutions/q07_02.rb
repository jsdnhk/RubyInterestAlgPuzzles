# 讀入處理日期的Date庫
require 'date'

# 取出日期區間的二進制數的第5數位到第8數位的值。
from_left = 19641010.to_s(2)[4,8].to_i(2)
to_left   = 20200724.to_s(2)[4,8].to_i(2)
# 遍歷左側和右側的8個數位
from_left.upto(to_left){|i|
  l = "%08b" % i   # 左側
  r = l.reverse    # 右側
  (0..1).each{|m|  # 中間
    value = "1001#{l}#{m}#{r}1001"
    begin
      puts Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
      rescue       # 忽略無效日期
    end
  }
}
