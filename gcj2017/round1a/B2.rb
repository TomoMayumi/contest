gets.to_i.times{|pnum|
  n,pp = gets.split.map(&:to_i)
  r = gets.split.map(&:to_i)
  q = (1..n).map{gets.split.map(&:to_i)}

  ans = 0
  target = 1
  list = r.map{|a|a*10}.zip(q.map{|a|a.map{|b|b*10}.sort})
  list.each{|rr,qlist|
    qlist.shift while qlist[0] && rr*target*9/10 > qlist[0]
  }
  while list.all?{|rr,qlist|qlist.size>0}
    if list.all?{|rr,qlist|rr*target*9/10 <= qlist[0] && qlist[0] <= rr*target*11/10}
      list.each{|rr,qlist|qlist.shift}
      ans += 1
    end
    target += 1
    list.each{|rr,qlist|
      qlist.shift while qlist[0] && rr*target*9/10 > qlist[0]
    }
  end

  puts "Case ##{pnum+1}: #{ans}"
}
