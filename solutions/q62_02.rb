require 'date'
WEEKS, DAYS = 6, 7

# 讀入假日數據文件
@holiday = IO.readlines("q62-holiday.txt").map{|h|
  h.split('/').map(&:to_i)
}
# 讀入調休工作日數據文件
@extra_workday = IO.readlines("q62-extra-workday.txt").map{|h|
  h.split('/').map(&:to_i)
}

# 計算符合條件的最大長方形的面積
def max_rectangle(cal)
  s = 0
  WEEKS.times{|row|
    DAYS.times{|left|
      (left..(DAYS - 1)).each{|right|
        # 計算高度
        h = (left..right).map{|w| cal[w + row * DAYS]}
        # 通過高度的最小值和橫向長度計算面積
        s = [s, h.min * (right - left + 1)].max
      }
    }
  }
  s
end

# 指定年份月份，獲取最大長方形面積
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 獲取該月1日的星期
  Date.new(y, m, -1).day.times{|d|      # 循環處理直到該月結束
    if (1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])) || @extra_workday.include?([y, m, d + 1])
      # 縱向工作日延續幾行？
      cal[first + d] = cal[first + d - DAYS] + 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
