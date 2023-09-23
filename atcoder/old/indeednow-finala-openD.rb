n=gets.to_i
g=(0..n).map{[]}
dp=[]
nv=[]
(n-1).times{
  a,b,t=gets.split.map(&:to_i)
  if t==1
    g[a]<<[b,1]
    g[b]<<[a,2]
  else
    g[a]<<[b,3]
    g[b]<<[a,3]
  end
}
rec=->(v,p){
  nv[v]=nvv=[0,0]
  dp[v]=[[0],[0]]
  g[v].each{|t,e|
    next if t==p
    rec[t,v]
    [0,1].each{|k|
      next if e&(k+1)==0
      dpk=dp[v][k]
      dp[t][k].each{|j|
        next if nvv[k]==t
        if dpk[0]<j+1
          dpk[0],dpk[1]=j+1,dpk[0]
          nvv[k]=t
        elsif !dpk[1] || dpk[1]<j+1
          dpk[1]=j+1
        end
      }
    }
  }
}

rec[1,-1]
p dp.zip(nv)[1,n].flat_map{|((a,b),(c,d)),(e,f)|[(d)?(a+d-1):0,(b)?(b+c-1):0,(e==f)?(a+c-1):0]}.max