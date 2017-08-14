n=gets.to_i
a=gets.split.map(&:to_i)

cnt=0
while a[-1]>=n
  a[-1]-=n
  (0..n-2).each{|i|a[i]+=1}
  a.sort!
  cnt+=1
  p a
end

p cnt