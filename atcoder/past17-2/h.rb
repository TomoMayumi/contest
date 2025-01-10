INF=100000000000000
n,m=gets.split.map(&:to_i)
classes=(1..n).map{gets.split.map(&:to_i)}
#dp[単位]=必要な労力
dp=Hash.new{INF}
dp[0]=0
classes.group_by{|a,b,c|b}.each{|_,l|
    dp.keys.each{|k|
        l.each{|a,b,c|
            nk=[k+c,m].min
            dp[nk]=[dp[nk],dp[k]+a].min
        }
    }
}
p dp[m]==INF ? -1 : dp[m]