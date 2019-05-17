#!ruby -nal
a=$F.sort
cost||={a=>0}
q||=[a]
l=[[1],[1,-1],[1,-1],[-1]]*2
until n=cost[$F]
  (l[t=(m=q.shift).index(?0)]+[-4]).map{|i|
    d=m.dup
    d[t]=d[t+i]
    d[t+i]=?0
    unless cost[d]
      cost[d]=cost[m]+1
      q<<d
    end
  }
end
p n


