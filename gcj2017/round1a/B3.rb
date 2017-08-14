gets.to_i.times{|t|
  n,p = gets.split.map(&:to_i)
  r = gets.split.map(&:to_i)
  q = (1..n).map{gets.split.map(&:to_i).sort}

  cnt = 1
  result = 0
  while q.all?{|a|a.size>0}
    q.zip(r).each{|qq,rr|
      qq.shift while (qq[0] && (qq[0] < rr*cnt*0.9))
    }
    if q.zip(r).all?{|qq,rr| qq[0] && (rr*cnt*0.9 <= qq[0]) && (qq[0] <= rr*cnt*1.1)}
      q.each{|qq|qq.shift}
      result += 1
    else
      cnt += 1
    end
  end

  puts "Case ##{t+1}: #{result}"
}
