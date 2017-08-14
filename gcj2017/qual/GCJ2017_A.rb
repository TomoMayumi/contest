t = gets.to_i

t.times{|pnum|
  s,k = gets.split
  s = s.chars.map{|c|(c=="-") ? 0 : 1}
  k   = k.to_i
  cnt = 0

  (0..(s.size-k)).each{|i|
    if s[i] == 0
      s[i,k] = s[i,k].map{|j|1-j}
      cnt += 1
    end
  }

  if s.all?{|j|j==1}
    result = cnt
  else
    result = "IMPOSSIBLE"
  end

  puts "Case ##{pnum+1}: #{result}"
}
