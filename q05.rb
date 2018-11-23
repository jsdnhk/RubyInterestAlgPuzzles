@cnt = 0

def change(target, coins, usable, layer)
  layer += 1
  puts("change(#{target}, #{coins}, #{usable}, #{layer})")
  coin = coins.shift
  if coins.size == 0 then
    if target / coin <= usable
      puts("target / coin = #{target} / #{coin} = #{target / coin} >= #{usable}")
      puts("@cnt = #{@cnt} + 1 = " + (@cnt += 1).to_s)
      @cnt
    end
  else
    (0..target/coin).each do |i|
      change(target - coin * i, coins.clone, usable - i, layer)
    end
  end
end

#change(1000, [500, 100, 50, 10], 15, 0)
change(200, [500, 100, 50, 10], 15, 0)
puts @cnt