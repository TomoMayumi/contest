n,m,k=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)

# 埋め切れるkを探す
kn=(1..100000000000000000000).bsearch{|i|
    a.sum{|ai|[i-ai/k,0].max}>m
}-1

# 埋め切れるk
m-=a.sum{|ai|[kn-ai/k,0].max}

# 残りを少ない順に振り分ける
aa=a.map.with_index{|ai,i|
    [(ai/k < kn) ? (k*kn+ai%k) : ai , i]
}.sort
(0...m).each{|i|aa[i][0]+=k}
puts aa.sort_by{|ai,i|i}.map{|ai,i|ai}*" "