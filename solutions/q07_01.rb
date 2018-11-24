# 讀入處理日期的Date庫
require 'date'

# 指定遍歷的日期區間
term = Date.parse('19641010')..Date.parse('20200724')

# 轉換成數值
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# 輸出轉換結果和自身一致的值
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}
