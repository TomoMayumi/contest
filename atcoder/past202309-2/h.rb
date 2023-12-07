n,m=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)
dp=Hash.new{0}
dp2={}
dp[0]=0
a.each{|ai|
    newdp = dp.dup
    newdp2 = {}
    dp.each{|k,v|
        newdp2[k+1] = [newdp[k+1],v].max if k+1<=m
        newdp[k] = v+ai
    }
    dp2.each{|k,v|
        newdp[k] = [newdp[k],v+ai].max
    }
    dp=newdp
    dp2=newdp2
}
p dp.merge(dp2){|k,v1,v2|[v1,v2].max}[m]
