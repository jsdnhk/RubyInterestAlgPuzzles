# 含有整數部分的情況
i = 1
while i += 1
  # 去除小數點，從左往右取10個字符
  str = ('%10.10f'%Math.sqrt(i)).sub('.','')[0..9]
  # 如果包含不重複的10個字符，則結束循環
  break if str.split('').uniq.length == 10
end
puts i

# 只看小數部分的情況
i = 1
while i += 1
  # 以小數點為界，只取小數部分
  str = ('%10.10f'%Math.sqrt(i)).split('.')[1]
  # 如果小數部分包含不重複的10個字符，則結束循環
  break if str.split('').uniq.length == 10
end
puts i
