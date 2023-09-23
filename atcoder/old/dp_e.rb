# Ç‹ÇæTLEÅBÅBÅB
INF = 1e20
(n,w),*wv=$<.map{|l|l.split.map(&:to_i)}

dp = {0=>0}

wv.each{|wi,vi|
  add={}
  dp.each{|val,wei|
    if (neww = wi+wei) <= w
      add[val+vi] = [dp[val+vi]||INF,neww].min
    end
  }
  dp.update(add)
}

p dp.keys.max
__END__
def dfs(w,wv,weight,value,idx)
  if wv[idx]
    [
      dfs(w,wv,weight,           value,           idx+1),
      dfs(w,wv,weight+wv[idx][0],value+wv[idx][1],idx+1)
    ].max
  else
    w<weight ? 0 : value
  end
end

p dfs(w,wv,0,0,0)
