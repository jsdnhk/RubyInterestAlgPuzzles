# 設置一個保持世界盃參賽國的數組
country = ["Brazil", "Croatia", "Mexico", "Cameroon",
           "Spain", "Netherlands", "Chile", "Australia",
           "Colombia", "Greece", "Cote d'Ivoire", "Japan",
           "Uruguay", "Costa Rica", "England", "Italy",
           "Switzerland", "Ecuador", "France", "Honduras",
           "Argentina", "Bosnia and Herzegovina", "Iran",
           "Nigeria", "Germany", "Portugal", "Ghana",
           "USA", "Belgium", "Algeria", "Russia",
           "Korea Republic"]
def search(countrys, prev, depth)
  # 取得所有後續可能的國名
  next_country = countrys.select{|c| c[0] == prev[-1].upcase}
  if next_country.size > 0 then
    # 如果有可用的國名，則加入隊列，併除去這個國名繼續遞歸搜索
    next_country.each{|c|
      search(countrys - [c], c, depth + 1)
    }
  else
    # 如果沒有可用國名，則判斷當前深度是否最大
    @max_depth = [@max_depth, depth].max
  end
end

# 從各個國家開始
@max_depth = 0
country.each{|c|
  search(country - [c], c, 1)
}
# 輸出最大深度（即連續的國名數目）
puts @max_depth
