def cutbar(m, n, current) # current是目前木棒的數目
  if current >= n then
    0 # 完成切分
  elsif current < m then
    1 + cutbar(m, n, current * 2) # 接下來是現在數目的2倍
  else
    1 + cutbar(m, n, current + m) # 加上刀的數目
  end
end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)
