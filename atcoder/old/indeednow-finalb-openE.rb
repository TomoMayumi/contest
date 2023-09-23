N=gets.to_i
BIT=[0]*(N+1)
def add x,v;(BIT[x]+=v;x+=x&-x)while BIT[x];end
def sum x;s=0;(s+=BIT[x];x&=x-1)while x>0;s;end

H=gets.split.map{|i|[i.to_i]}
H.sort_by{|i,|-i}.each.with_index(1){|i,j|i<<j}
if H.map{|i,j|i}.uniq.size != N
  p(-1)
else
  ans=0
  H.each{|i,j|
    ans+=sum(j)*i
    add(j,1)
  }
  p ans
end