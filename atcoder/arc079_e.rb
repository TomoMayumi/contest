n=gets.to_i
a=gets.split.map &:to_i
cnt=0
until a.all?{|i|i<n}
  b=a.map{|i|i/n}.inject(:+)
  a.map!{|i|i%n+b-i/n}
  cnt+=b
end
p cnt