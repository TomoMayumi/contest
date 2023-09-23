def g;gets.split.map(&:to_i)end
n,m=g
ni=[0]*(n+1)
good=(0..n).map{[]}
m.times{
  a,b=g
  ni[a]+=1
  good[b]<<a
}
pr=[1]*(n+1)
update=true
while update
  update=false
  (1..n).each{|i|
    t=pr[i]
    u=pr[i]=0.1+0.9*good[i].map{|j|pr[j]/ni[j]}.inject(:+)
    update=true if t!=u
  }
end
puts pr[1..-1]