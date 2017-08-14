def g;gets.split.map(&:to_i)end
N,M,S,G=g
L=(0...N).map{[]}
M.times{
  a,b,c=g
  L[a][b]=L[b][a]=c
}
q=[[0,[S]],[1e9]]
gn={}
while q[0]
  e,n=q.shift
  next if gn[n[-1]]
  gn[n[-1]]=e
  break if n[-1]==G
  L[n[-1]].each.with_index{|i,j|
    i&&(
      nxt=[i+e,n+[j]]
      q.insert((0...q.size).bsearch{|k|(q[k]<=>nxt)>0},nxt)
    )
  }
end
puts n*" "
__END__
#N.times{|k|N.times{|i|N.times{|j|L[i][j]=[L[i][j],L[i][k]+L[k][j]].min}}}
ans=[s=S]
while s!=G
  ans<<s=(0...N).find{|i|d[s][i]&&d[s][i]+L[i][G]==L[s][G]}
end
puts ans*" "
