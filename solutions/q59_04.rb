# 設置搜索的邊界
W, H = 4, 4
# 從單元格頂點有沒有往上下左右方向的線
# U: 上, D: 下, L: 左, R: 右用比特列設置方向
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 單元格頂點只計算內側，因此行列減1
@width, @height = W - 1, H - 1
# 設置單元格頂點的可能狀態
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@row = {}

# 對每行統計上下連接的組合
def make_row(cell)
  if cell.size == @width then   # 能組合出1行的時候
    u = cell.map{|l| l & U > 0} # 往上連線的位置(T/F)
    d = cell.map{|l| l & D > 0} # 往下連線的位置(T/F)
    if @row.has_key?(u) then
      @row[u][d] = @row[u].fetch(d, 0) + 1
    else
      @row[u] = {d => 1}
    end
    return
  end
  @dir.each{|d|
    # 最左側或者左側的線和右側的線重合時
    if (cell.size == 0) ||
       ((d & L > 0) == (cell.last & R > 0)) then
      make_row(cell + [d])
    end
  }
end

make_row([])

# 統計第1行往下連線的組合數
count = Hash.new(0)
@row.each{|up, down|
  down.each{|k, v| count[k] += v }
}

# 從第2行開始，結合上一行進行統計
h = 1
while h < @height do
  new_count = Hash.new(0)
  count.each{|bar, cnt|
    @row[bar].each{|k, v| new_count[k] += cnt * v }
  }
  h += 1
  count = new_count
end

p count.inject(0){|sum, (k, v)| sum + v}
