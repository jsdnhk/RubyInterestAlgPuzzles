@n = 8
# 包含丟手絹的人
@all = (0..@n).to_a

# 初始狀態
start = {}
start[(1..@n).to_a] = []

# 終止狀態
goal = {}
@n.times{|i|
  goal[(1..@n).to_a.reverse.rotate(i)] = []
}

# 求移動距離
def dist(log)
  return 0 if log.size == 0
  check = log.clone
  pre = check.shift
  sum = @n + pre
  check.each{|c|
    sum += @n + (c + @n - pre) % @n
    pre = c
  }
  sum
end

# 搜索（direction為true時是順序方向，false時為逆序方向）
def search(child, direction)
  child.clone.each{|key, value|
    oni = (@all - key)[0] # 沒有被使用的就是丟手絹的人
    @n.times{|i|
      k = key.clone
      k[i] = oni
      v = value + [i]
      if child.has_key?(k) then
        if direction then # 順序方向
          child[k] = v if dist(v) < dist(child[k])
        else              # 逆序方向
          child[k] = v if dist(v.reverse) < dist(child[k].reverse)
        end
      else
        child[k] = v
      end
    }
  }
end

cnt = 0
while (start.keys & goal.keys).size == 0 do
  if cnt % 2 == 0 then # 偶數時順序方向搜索
    search(start, cnt % 2 == 0)
  else                 # 奇數時逆序方向搜索
    search(goal, cnt % 2 == 0)
  end
  cnt += 1
end

# 雙向搜索結果合流時，計算最短移動距離
min = 98
(start.keys & goal.keys).each{|c|
  d = dist(start[c] + goal[c].reverse)
  min = [min, d].min
}

puts min
