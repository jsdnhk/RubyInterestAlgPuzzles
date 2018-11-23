#!/usr/bin/ruby
# count numbers of binary reverse-same date
require 'date'

d_start = Date.new(1964, 10, 10)
#d_end = Date.new(1964, 10, 12)
d_end = Date.new(2020, 7, 24)
d_cur = d_start
count = 0

until d_cur > d_end
  str_cur = d_cur.strftime("%Y%m%d")
  if str_cur.to_i.to_s(2) == str_cur.to_i.to_s(2).reverse
    p str_cur
    count += 1
  end
  d_cur += 1
end

puts ("The count numbers of binary reverse-same date: #{count}")