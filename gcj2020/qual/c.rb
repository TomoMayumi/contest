(1..gets.to_i).each{|no|
  n=gets.to_i
  se=n.times.flat_map{|i|gets.split.map(&:to_i).zip([:s,:e],[i,i])}.sort
  free = [?C,?J]
  ans = " "*n
  se.each{|time,type,i|
    case type
    when :s
      if free[0]
        ans[i] = free.pop
      else
        ans = "IMPOSSIBLE"
        break
      end
    when :e
      free << ans[i]
    end
  }
  puts "Case ##{no}: #{ans}"
}
