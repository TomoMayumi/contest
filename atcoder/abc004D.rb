r,g,b=gets.split.map(&:to_i)
dp=(-650..650).map{[]}
cost=->i,j{
  case
  when j<=r;  (i+100).abs
  when j<=r+g;i.abs
  else ;      (i-100).abs
  end
}
dfs=->i,j{
  case
  when j==0;    0
  when i==-650; 1<<30
  else ;        dp[i+650][j]||=[dfs[i-1,j],dfs[i-1,j-1]+cost[i,j]].min
  end
}
p dfs[650,r+g+b]