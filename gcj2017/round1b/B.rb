def check(r)
  #p r
  if (r+r[0]).chars.map{|c|
  "ROYGBV".index(c)}.each_cons(2).any?{|i,j|((i+1)%6==j)||((j+1)%6==i)||i==j}
    raise r
  end
end

gets.to_i.times{|t|
  _,*unicorns = gets.split.map(&:to_i)
  table = "ROYGBV"
  dis = [3,2,1,0,1,2]

  if (0..5).any?{|i|
    tmp = unicorns.rotate(i)
    aa = tmp[0]+(tmp[1]-tmp[5]).abs > tmp[2..4].inject(:+)
    #p tmp if aa
    aa
  }
    #p unicorns
    result = "IMPOSSIBLE"
  else
    result = ""
    init = idx = (0..5).max_by{|i|[unicorns[i],unicorns[i-1]+unicorns[(i+1)%6]]}
    while unicorns.any?{|i|i>0}
      #p [unicorns,idx]
      if unicorns[idx]>0
        unicorns[idx]-=1
        result+=table[idx]
        idx = (idx+2..idx+4).map{|i|i%6}.max_by{|i|[unicorns[i],unicorns[i-1]+unicorns[(i+1)%6],dis[init-i]]}
      else
        raise
      end
    end
    check result
  end

  puts "Case ##{t+1}: #{result}"
}
