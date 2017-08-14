t = gets.to_i

t.times{|pnum|
  n = gets.to_i
  dig = n.to_s.size

  tgt = 0

  while tgt < dig
    i = n.to_s.reverse[tgt].to_i
    j = n.to_s.reverse[tgt+1].to_i

    if i < j
      n -= n%(10**(tgt+1))+1
      dig = n.to_s.size
    end
    tgt += 1
  end

  result = n
  puts "Case ##{pnum+1}: #{result}"
}
