#!/usr/bin/ruby
# Turn over the cards（100 cards)

$CARDS = Array.new(100) do
  false
end

for start_idx in (1...$CARDS.length)
  interval = (start_idx + 1) - 1
  turn_count = 0
  for turn_idx in (start_idx...$CARDS.length)
    if turn_idx == start_idx
      $CARDS[turn_idx] = !$CARDS[turn_idx]
      turn_count = 0
    elsif turn_count == interval
      $CARDS[turn_idx] = !$CARDS[turn_idx]
      turn_count = 0
    else
      turn_count += 1
      next
    end
  end
end

puts("The card numbers turned backed:")
for start_idx in (1...$CARDS.length)
  print("#{start_idx + 1} ") if !$CARDS[start_idx]
end