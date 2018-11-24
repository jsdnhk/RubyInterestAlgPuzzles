val = []
256.times{|i|
  # 反轉0~255
  rev = ('%08b'%i).reverse.to_i(2)

  if i < rev then
    s = i.to_s + rev.to_s
    # 如果使用了0~9這10個數字個一次，就符合條件
    val.push([i, rev]) if s.split('').uniq.size == s.length
  end
}

ip = []
val.combination(2){|a, b|
  # 使用了0~9這10個數字個一次，就形成分組
  ip.push([a, b]) if (a + b).join.split('').uniq.size == 10
}
# 組合各分組輸出結果
puts ip.size * 8
