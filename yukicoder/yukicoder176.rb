a,b,t=gets.split.map &:to_i
p ([(t/b+1)*b]+(0..[a,t/b].min).map{|i|t+(a-(t-b*i)%a)%a}).min