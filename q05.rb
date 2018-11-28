require 'pp'

@coin_pattern = []
@cnt = 0
(0..2).each{|coin500|        # 500港幣硬幣最多2枚
  (0..10).each{|coin100|     # 100港幣硬幣最多10枚
    (0..20).each{|coin50|    # 50港幣硬幣最多15枚
      (0..50).each{|coin20|  # 10港幣硬幣最多15枚
        (0..100).each{|coin10|  # 10港幣硬幣最多15枚
          if coin500 * 500 + coin100 * 100 + coin50 * 50 + coin20 * 20 + coin10 * 10 == 1000 then
            @coin_pattern.concat([[500] * coin500 + [100] * coin100 + [50] * coin50 + [20] * coin20 + [10] * coin10])
            @cnt += 1
          end
        }
      }
    }
  }
}

@coin_pattern.each do |p_ary|
  p (p_ary)
end
puts @cnt


=begin
@cnt = 0
@coins = [500, 100, 50, 10]
@coins_patterns = []

def change(target, pattern, usable)
  if(target == 0 && pattern.length <= usable)
    @coins_patterns += [pattern]
    @cnt += 1
  end
  @coins.each do |coin|
    change(target - coin, pattern.concat([coin]), usable)
  end
end

change(1000, [], 15)
p @coins_patterns
p @cnt
=end

=begin
  coin = coins.shift
  if coins.size == 0 then
    if target / coin <= usable
      @coins_patterns.append(pattern)
      @cnt += 1
    end
  else
    (0..target/coin).each do |i|
      change(target - coin * i, coins.clone, usable - i)
    end
  end
end

change(1000, [], 15)
puts @cnt
=end