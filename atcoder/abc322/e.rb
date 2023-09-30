n,k,P=gets.split.map(&:to_i)
plan=(1..n).map{
    c,*a=gets.split.map(&:to_i)
    [c,a]
}
dp={}
dp[[0]*k]=0
plan.each{|c,a|
    dp.dup.each{|params,cost|
        newparams=(0...k).map{|i|[a[i]+params[i],P].min}
        dp[newparams] = cost+c if !dp[newparams] || dp[newparams] > cost+c
    }
}
p dp[[P]*k]||-1
