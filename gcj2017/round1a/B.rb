gets.to_i.times{|pnum|
  n,pp = gets.split.map(&:to_i)
  r = gets.split.map(&:to_i)
  q = (1..n).map{gets.split.map(&:to_i).sort}

  t = q.map.with_index{|list,i|
    list.map{|val|
      (((val*9)/(r[i]*10))..((val*11)/(r[i]*10))+1).select{|j|
        mod = (val-r[i]*j).abs*10
        (r[i]*j >= mod)
      }
    }.reject{|j|j==[]}
  }

  ans = 0
  target = 1
  while t.all?{|a|a.size>0}
    if t.map{|a|a[0]}.inject{|s,rr|s&rr}.size>0
      t.each{|a|a.shift}
      ans += 1
    else
      t.min_by{|a|a[0]}.shift
    end
#    p [ans,t]
  end

  puts "Case ##{pnum+1}: #{ans}"
}
