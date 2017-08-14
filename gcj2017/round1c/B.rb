gets.to_i.times{|t|
  ac,aj = gets.split.map(&:to_i)
  sch = (1..(ac+aj)).map{|i|gets.split.map(&:to_i)+[(i<=ac)?"c":"j"]}.sort

  if sch[0][0] != 0
    sch.shift [0,sch[0][0]-1,sch[0][2]+"1"]
  end

  if sch[-1][0] != 24*60
    sch << [sch[-1][1]+1,24*60,sch[-1][2]+"1"]
  end

  sch2 = []
  

  p sch

  result = 0
  puts "Case ##{t+1}: #{result}"
}
