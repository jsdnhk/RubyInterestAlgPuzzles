#!/usr/bin/ruby
#The min. palindrome num > 10 to binary, octet and decimal

def is_palindrome_num_to_2_8_10?(num)
  bln_return = false
  str_cur_num_2, str_cur_num_8, str_cur_num_10 = nil, nil, nil
  begin
    str_cur_num_2 = num.to_s(2)
    str_cur_num_8 = num.to_s(8)
    str_cur_num_10 = num.to_s(10)
    if str_cur_num_2 != str_cur_num_2.reverse
      raise("!= binary")
    elsif str_cur_num_8 != str_cur_num_8.reverse
      raise("!= octet")
    elsif str_cur_num_10 != str_cur_num_10.reverse
      raise("!= decimal")
    end
    bln_return = true
  rescue Exception => ex
    puts("#{num} #{ex.message}")
    bln_return = false
  ensure
    if bln_return
      p str_cur_num_2, str_cur_num_8, str_cur_num_10
    end
  end
  bln_return
end

start_num = 11
cur_num = start_num

until is_palindrome_num_to_2_8_10?(cur_num)
  cur_num += 1
end
puts ("The min. palindrome num > 10 is \'#{cur_num}\'!")
