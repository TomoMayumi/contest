n,q=gets.split.map(&:to_i)
s=(1..n).map{gets.chomp.chars.map{|e|e=='#'?1:0}+[1]}+[[1]*(n+1)]
cnt=[[0]*(n+1)]+s.each_cons(2).map{|a,b|[0]+a.zip(b).each_cons(2).map{|(x,y),(t,u)|x+y+t+u==0?1:0}}
#pp cnt
cnt2=cnt.map{|e|sum=0;e.map{|f|sum+=f}}
#pp cnt2
cnt3=cnt2.transpose.map{|e|sum=0;e.map{|f|sum+=f}}.transpose
#pp cnt3
q.times{
  u,d,l,r=gets.split.map{|e|e.to_i-1}
  p cnt3[d][r]-cnt3[u][r]-cnt3[d][l]+cnt3[u][l]
}