n,a,b=gets.split.map(&:to_i)
h=(1..n).map{gets.to_i}
r=(h.max/b)+1
l=1
while l<r
  c=(l+r)/2
  if h.map{|i|[(i-c*b+a-b-1)/(a-b),0].max}.inject(:+) <= c
    r=c
  else
    l=c+1
  end
end
p l
