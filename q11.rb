#!/usr/bin/ruby

@memo = []
def fib(n)
  return @memo[n - 1] if @memo.length == n
  if (n == 0) || (n == 1) then
    @memo[n] = 1
  else
    @memo[n] = fib(n - 1) + fib(n - 2)
  end
end

p fib(8)
p @memo