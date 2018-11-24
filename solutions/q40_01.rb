ip = Array.new
(1 << 16).times{|i|
  # 反轉16位的數字
  j = ('%016b' % i).reverse.to_i(2)

  # 生成分割的十進制數字符串
  s = '%d.%d.%d.%d' % [i>>8, i&0xff, j>>8, j&0xff]

  # 如果只用到了10個數字和點號，則符合條件
  ip.push(s) if s.split("").uniq.length == 11
}
puts ip.size
puts ip
