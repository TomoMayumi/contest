h=Hash[15,2244,12,1870,10,1520,5,850,3,550,2,380]
m={0=>0}
50.times{|i|
  m.update(h.map{|k,v|[k+i,v+m[i]]}.to_h){|_,*t|t.min} if m[i]
}

puts $<.map{|l|m[l.to_i/100]}[0..-2]
