BIT=[0]*200001
def add x,v;(BIT[x]+=v;x+=x&-x)while BIT[x];end
def sum x;s=0;(s+=BIT[x];x&=x-1)while x>0;s;end

n,k=gets.split.map &:to_i
ar=(1..n).map{gets.to_i}

list = ar.inject([0]){|s,r|s<<(s[-1]+r-k)}[1..-1]

rank = list.sort

ans = list.count{|i|i>=0}

list.each{|i|
  x=rank.bsearch_index{|j|j>=i}+1
  ans += sum(x)
  add(x,1)
}
p ans
