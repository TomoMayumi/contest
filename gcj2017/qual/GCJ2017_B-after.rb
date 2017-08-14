gets.to_i.times{|pnum|
  n = gets.chomp.chars.map(&:to_i)

  i = 0
  while i < n.size-1
    if n[i] > n[i+1]
      (i+1..n.size-1).each{|j|n[j]=9}
      while n[i] == 0
        n[i] = 9
        i -= 1
      end
      n[i] -= 1
      i-=1 if i > 0
    else
      i+=1
    end
  end

  result = n.join.to_i
  puts "Case ##{pnum+1}: #{result}"
}
