#!/usr/bin/ruby
# the even numbers is Collatz until 10000


num_count = 0
(2..10000).each do |i|
  next unless i.even?
  cur_i = ((i * 3) + 1)
  loop do
    cur_i = cur_i.even? ? (cur_i / 2) : ((cur_i * 3) + 1)
    if cur_i == i
      puts i
      num_count += 1
      break
    elsif cur_i == 1
      break
    else
      next
    end
  end
end

puts("Total Collatz even no. amount: #{num_count}")