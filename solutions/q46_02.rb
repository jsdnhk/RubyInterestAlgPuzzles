N = 4

def search(rows)
  return 1 if rows.size == N # 已搜索完所有行，結束搜索
  count = 0
  (2**N).times{|row|
    # 四個對角○和×是否交錯出現
    cross = rows.select{|r| (row & ~r) > 0 && (~row & r) > 0}
    count += search(rows + [row]) if cross.count == 0
  }
  count
end

puts search([])
