q,h,s,d=gets.split.map(&:to_i)
n=gets.to_i

one=[q*4,h*2,s].min
two=[one*2,d].min

p two*(n/2)+one*(n%2)