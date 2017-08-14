eg=Hash.new{|h,k|h[k]={}}

n=gets.to_i
(n-1).times{
  a,b,c=gets.split.map(&:to_i)
  eg[a][b]=eg[b][a]=c
}
q,k=gets.split.map(&:to_i)

que=[k]
cost=[]
cost[k]=0

while que[0]
  v=que.pop
  eg[v].each{|key,val|
    if !cost[key]
      cost[key]=cost[v]+val
      que << key
    end
  }
end

q.times{
  x,y=gets.split.map(&:to_i)
  p cost[x]+cost[y]
}