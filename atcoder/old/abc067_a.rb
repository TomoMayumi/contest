a,b=gets.split.map{|i|i.to_i%3}
puts (a==0||b==0||a+b==3)?"Possible":"Impossible"