n=gets.to_i
a=gets.split.map{|i|(i=i.to_i)%2>0?0:i%4>0?1:2}
a,b,c=(0..2).map{|i|a.count i}
puts (a>c&&(a+c<n||a-1>c))?:No:"Yes"