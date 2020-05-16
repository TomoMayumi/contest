n,s,t=gets.split.map(&:to_i)
ab=$<.map{|l|l.split.map(&:to_i)}
ab1 = ab[0,ab.size/2]
ab2 = ab[ab.size/2..-1]
# 半分全列挙
# 半分までの日であり得る体重のパターン数を求める
ptn1 = {s=>1}
ab1.each{|a,b|
  ptn1=ptn1.each_with_object(Hash.new{|h,k|h[k]=0}){|(k,v),h|
    if k+b<=t
      h[k+b]+=v
    end
    h[k-a]+=v
  }
}

# 後ろ半分で、とりうる体重変化をすべて列挙。その際に取りうる最大の体重も記憶。
ptn2 = {[t,t]=>1}
ab2.reverse_each{|a,b|
  ptn2=ptn2.each_with_object(Hash.new{|h,k|h[k]=0}){|((now,max),v),h|
    h[[now+a,[max,now+a].max]]+=v
    h[[now-b,max]]+=v
  }
}
# 取りうる最大の体重を考慮した、後半から見て中間の日にとれる体重を求める
ptn3 = ptn2.map{|(now,max),v|[now-(max-t),v]}
# 前半の結果の体重に対し、累積和をとる
ptn3.each{|k,v|ptn1[k]+=0}
cumsum={}
sum=0
ptn1.sort.each{|k,v|
  cumsum[k]=(sum+=v)
}
# 前半の体重と、後半の体重のパターンの掛け算
p ptn3.map{|k,v|cumsum[k]*v}.inject(:+)
__END__
n,s,t=gets.split.map(&:to_i)
ab=$<.map{|l|l.split.map(&:to_i)}
$fcnt = 0
def dfs(list,now,max)
  $fcnt += 1
  return [false,0] if max<now
  return [true,1] unless list[0]
  (a,b),*list = list
  allok,cnt = dfs(list,now+b,max)
  return [true, cnt*2] if allok
  return [false, cnt + dfs(list,now-a,max)[1]]
end
p dfs(ab,s,t)[1]
p $fcnt
