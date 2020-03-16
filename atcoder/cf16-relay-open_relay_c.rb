n,*a=$<.map(&:to_i)
a=a[0,2**n]

while a.size>1
  a=a.each_slice(2).map{|a,b|a==b ? a : (a-b).abs}
end
p a[0]