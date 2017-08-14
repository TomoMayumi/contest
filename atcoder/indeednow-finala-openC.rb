def g;gets.split.map(&:to_i)end
n,m=g
j=(1..n).map{g}.sort_by{|i|i[3]}
m.times{
  x,y,z=g
  j.bsearch{|a,b,c,w|