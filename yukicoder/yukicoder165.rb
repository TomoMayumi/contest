def g;gets.split.map(&:to_i)end
n,b=g
mx=Hash.new{[]}
my=Hash.new{[]}
m=(0...n).map{|i|
  x,y,q=g
  mx[x]+=[i]
  my[y]+=[i]
  [x,y,q]
}
def cum a
  Hash[a.inject([[0,[]]]){|s,(k,v)|s+[[k,s[-1][1]+v]]}[1..-1]]
end
sxa=cum mx.sort
sxb=cum mx.sort.reverse
sya=cum my.sort
syb=cum my.sort.reverse
p mx.keys.sort.repeated_combination(2).map{|xi,xj|
  myks=my.keys.sort
  yii=0
  my.keys.sort.each{|yj|
    t=sxb[xi]&sxa[xj]&syb[yi]&sya[yj]
    b<(t.map{|k|m[k][2]}.inject(:+)||0)?0:t.size
  }.max
}.max