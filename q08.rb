#!/usr/bin/ruby
# bot sweeper (backtracking)

N = 3

def move(log)
  return 1 if log.size == N + 1

  cnt = 0
  #[0, 1] => UP, [0, -1] => DOWN, [1, 0] => LEFT, [-1, 0] => RIGHT
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |d|
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    if !log.include?(next_pos)
      p (log + [next_pos])
      cnt += move(log + [next_pos])
    end
  end
  cnt
end

puts move([[0,0]])