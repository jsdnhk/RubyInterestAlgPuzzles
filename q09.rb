#!/usr/bin/ruby
#Queue MEN20 WOMEN10

require 'pp'

boy, girl = 20, 10
boy, girl = boy + 1, girl + 1 # include the case of boy = 0, girl = 0
ary = Array.new(boy * girl){0}
p ary
ary[0] = 1
p ary
count = 0
girl.times{|g|
  boy.times{|b|
    if (b != g) && (boy - b != girl - g) then   # 2 groups men and women both not same
      puts("(#{b} != #{g}) && (#{boy - b} != #{girl - g})")
      count += 1
      ary[b + boy * g] += ary[(b - 1) + boy * g] if b > 0
      ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0
    end
  }
}
puts("count: #{count}")
pp ary
puts ("ary[-2]: #{ary[-2]} ; ary[#{-boy - 1}]: #{ary[-boy - 1]}")
puts ary[-2] + ary[-boy - 1]
