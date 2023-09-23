n=gets.to_i
cnt=[0]*n
sum=0
q=(1..2*n).map{[]}
n.times{|i|
  s,t=gets.split.map(&:to_i)
  q[s-1]=i
  q[t-1]<<i
}
q.each{|i|
  case i
  when Array
    i.each{|j|
      cnt[j]+=sum
    }
  else
    sum+=1
    cnt[i]=-sum
  end
}
puts cnt