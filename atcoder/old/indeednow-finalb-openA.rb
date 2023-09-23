#def g;gets.split.map(&:to_i)end
a,b=$<.map(&:to_i)
p (a..b).inject(0){|s,i|(s+i**2*(i+1)/2)%1000000007}