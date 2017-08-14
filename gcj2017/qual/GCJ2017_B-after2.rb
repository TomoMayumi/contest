gets.to_i.times{|pnum|
  n = gets.to_i
  dig = n.to_s.size

  result = 0
  cnt = 0
  dig.downto(1){|i|
    all1 = ("1"*i).to_i
    while n >= all1 && cnt < 9
      n -= all1
      result += all1
      cnt += 1
    end
  }

  puts "Case ##{pnum+1}: #{result}"
}
