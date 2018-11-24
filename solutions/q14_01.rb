# 設置一個保持世界盃參賽國的數組
@country = ["Brazil", "Croatia", "Mexico", "Cameroon",
            "Spain", "Netherlands", "Chile", "Australia",
            "Colombia", "Greece", "Cote d'Ivoire", "Japan",
            "Uruguay", "Costa Rica", "England", "Italy",
            "Switzerland", "Ecuador", "France", "Honduras",
            "Argentina", "Bosnia and Herzegovina", "Iran",
            "Nigeria", "Germany", "Portugal", "Ghana",
            "USA", "Belgium", "Algeria", "Russia",
            "Korea Republic"]
# 是否使用過的標記數組
@is_used = Array.new(@country.size, false)

def search(prev, depth)
  is_last = true
  @country.each_with_index{|c, i|
    if c[0] == prev[-1].upcase then
      if !@is_used[i] then
        is_last = false
        @is_used[i] = true
        search(c, depth + 1)
        @is_used[i] = false
      end
    end
  }
  @max_depth = [@max_depth, depth].max if is_last
end

# 從各個國家開始
@max_depth = 0
@country.each_with_index{|c, i|
  @is_used[i] = true
  search(c, 1)
  @is_used[i] = false
}
# 輸出最大深度（即連續的國名數目）
puts @max_depth
