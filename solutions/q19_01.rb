require 'prime'

primes = Prime.take(6)        # 用6個質數充當a~f
min = primes[-1] * primes[-1] # 把最小數字設置成最大質數的平方
min_friend = []

primes.permutation{|prime|    # 按順序排列的6個質數
  # 按順序選取2個數字做乘法
  friends = prime.each_cons(2).map{|x, y| x * y}
  # 開頭和結尾的數字乘方
  friends += [prime[0], prime[-1]].map{|x| x * x}
  if min > friends.max then   # 更新最小數字的情況
    min = friends.max
    min_friend = friends
  end
}

puts min
p min_friend
