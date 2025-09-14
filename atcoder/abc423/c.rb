n,r=gets.split.map(&:to_i)
l=gets.split.map(&:to_i)
pre=l.take(r).drop_while{|e|e==1}
post=l.drop(r).reverse.drop_while{|e|e==1}
all=pre+post
p all.count(1)+all.size