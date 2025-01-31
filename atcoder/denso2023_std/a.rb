a,b,c=gets.split.map(&:to_i)
p [a+b+c,a+b-c,a-b+c,a-b-c].max
