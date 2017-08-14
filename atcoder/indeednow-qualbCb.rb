N=gets.to_i
adj=(0..N).map{[]}
(N-1).times{
  a,b=gets.split.map(&:to_i)
  adj[a]<<b
  adj[b]<<a
}
q=[1]
ans=[]
gone=[nil]*(N+1)
gone[1]=true
while q[0]
  d=q.shift
  ans<<d
  adj[d].each{|i|
    next if gone[i]
    gone[i]=true
    c=r=0
    l=q.size
    while r<l
      c=(r+l)/2
      if q[c]<=i
        r=c+1
      else
        l=c
      end
    end
    q.insert(r,i)
  }
end
puts ans*" "