#!/usr/bin/ruby
# Separate a stick by cutting


def get_times_cutting(parts: nil, ppl: nil, stick: nil, layer: nil)
  layer += 1
  puts ("get_times_cutting(parts: #{parts}, ppl: #{ppl}, stick: #{stick}, layer: #{layer})")
  if stick >= parts
    puts ("return 0")
    0 #Finish cutting
  #stick < parts
  elsif stick <= ppl
    1 + get_times_cutting(parts: parts, ppl: ppl, stick: stick * 2, layer: layer)
  elsif stick > ppl
    1 + get_times_cutting(parts: parts, ppl: ppl, stick: stick + ppl, layer: layer)
  end
end

#puts get_times_cutting(parts: 22, ppl: 3, stick: 18, layer: 0)
#puts get_times_cutting(parts: 10, ppl: 2, stick: 1)
puts get_times_cutting(parts: 20, ppl: 3, stick: 1, layer: 0)
puts get_times_cutting(parts: 100, ppl: 5, stick: 1, layer: 0)
