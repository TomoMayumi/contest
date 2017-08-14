def check(r)
  if (r+r[0]).chars.map{|c|"ROYGBV".index(c)}.each_cons(2).any?{|i,j|((i+1)%6==j)||((j+1)%6==i)}
    raise r
  end
end

gets.to_i.times{|t|
  _,*unicorns = gets.split.map(&:to_i)
  table = "ROYGBV"

  if (0..5).any?{|i|
    tmp = unicorns.rotate(i)
    tmp[0] > tmp[2..4].inject(:+)
  }
    result = "IMPOSSIBLE"
  else
    result = "."*unicorns.size
    idx = 0
    while unicorns.any?{|i|i>0}
      p unicorns
      if unicorns[idx]>0
        unicorns[idx]-=1
        result+=table[idx]
        idx = (idx+2)%6
      else
        idx = (idx+1)%6
      end
    end
    check result
  end

  puts "Case ##{t+1}: #{result}"
}
