#!/usr/bin/ruby
# Separate a stick by cutting


def get_times_cutting(parts: nil, ppl: nil)
  bln_return = true
  cutting_time = 0
  begin
    raise ("Invalid param input: parts: #{parts}, ppl: #{ppl}") unless parts and ppl and parts > 0 and ppl >0 and parts >= ppl
    cur_stick = 1
    while parts > cur_stick
      cur_stick += cur_stick < ppl ? cur_stick : ppl
      cutting_time += 1
    end
  rescue Exception => ex
    puts (ex.message)
    bln_return = false
  ensure
    puts("for parts: #{parts}, ppl: #{ppl}, the required cutting_time: #{cutting_time}!") if bln_return
  end
end


get_times_cutting(parts: 20, ppl: 3)
get_times_cutting(parts: 100, ppl: 5)