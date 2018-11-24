a = b = 1
count = 0
while (count < 11) do
  c = a + b
  # 分開各個數位進行求和
  sum = 0
  c.to_s.split(//).each {|e| sum += e.to_i}
  if (c % sum == 0) then
    # 輸出能整除的情況
    puts c
    count += 1
  end
  a, b = b, c
end
