N = 11
@memo = {}

def search(cards, num)
  return 1 if num == 0
  return @memo[cards] if @memo.has_key?(cards)

  # 利用位運算設置包夾位置
  mask = (1 << (num + 1)) + 1
  count = 0
  while mask < (1 << (N * 2)) do
    # 如果可以放置，則遞歸地搜索
    count += search(cards | mask, num - 1) if cards & mask == 0
    # 包夾位置移動一位
    mask <<= 1
  end
  @memo[cards] = count
end

puts search(0, N)
