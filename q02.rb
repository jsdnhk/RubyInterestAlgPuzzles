#!/usr/bin/ruby
# The palindrome num with operator within the range from 1000 to 9999

$target_range=Range.new(1000,9999)

def get_palindrome_num_with_operator(cur_num)
  exp_return = nil
  str_num, str_num_r = "", ""
  str_num_result = ""
  arr_num = []
  arr_op=['+', '-', '*', '/', '']
  begin
    str_num = cur_num.to_s(10)
    str_num_r = str_num.reverse
    str_num.each_char{|c| arr_num.push(c.to_s)}

    for idxA in (0...arr_op.length)
      expA = arr_num[0] + arr_op[idxA] + arr_num[1]
      for idxB in (0...arr_op.length)
        expB = arr_op[idxB] + arr_num[2]
        for idxC in (0...arr_op.length)
          expC = arr_op[idxC] + arr_num[3]
          exp_total = expA + expB + expC
          str_num_result = eval_result(exp_total)
          if str_num_result and $target_range.cover?(str_num_result.to_i) and \
          $target_range.cover?(str_num_r.to_i) and str_num_result.to_i == str_num_r.to_i and \
          str_num_result.to_i != str_num.to_i
            exp_return = exp_total
            return exp_return
          else
            next
          end
        end
      end
    end
  rescue Exception => ex
    p ex.backtrace
    puts("Error in get_palindrome_num_with_operator(#{cur_num}): [#{ex.message}]")
    exp_return = nil
  ensure
    p exp_return if exp_return
  end
  exp_return
end

def eval_result(exp)
  result_return = nil
  begin
    exp = exp.gsub(/([\d]+)/, '"\1".to_i(10)')
    result_return = eval(exp)
  rescue Exception => ex
    #puts("Error in eval_result(#{exp}): [#{ex.message}]")
    result_return = nil
  end
  result_return
end

for cur_num in $target_range
  exp_return = get_palindrome_num_with_operator(cur_num)
  if exp_return
    str_cur_num = cur_num.to_s
    puts ("The palindrome num with operator is \'#{str_cur_num}\'!")
    puts ("The related expression is \'#{exp_return}\' => \'#{str_cur_num.to_i(10).to_s.reverse}\'!")
    next
  else
    next
  end
end