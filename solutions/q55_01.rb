@memo = {}
def cut_cake(w, h, diff)
  # 如果縱向較長，則替換成橫向
  w, h = h, w if w < h
  # 如果存在緩存，則應用緩存
  return @memo[[w, h, diff]] if @memo.has_key?([w, h, diff])

  # 搜索到最後，除了相差1以外的都設置成無窮大
  if w == 1 && h == 1 then
    return @memo[[w, h, diff]] = (diff == 1)?0:Float::INFINITY
  end

  # 橫向縱向切分
  tate = (1..(w/2)).map{|i|
    h + cut_cake(w - i, h, i * h - diff)
  }
  yoko = (1..(h/2)).map{|i|
    w + cut_cake(w, h - i, w * i - diff)
  }
  # 從橫向縱向兩種切法中選較小的一個
  @memo[[w, h, diff]] = (tate + yoko).min
end

puts cut_cake(16, 12, 0)
