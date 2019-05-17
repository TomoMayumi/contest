N=10**5
BIT=[0]*(N+1)
def add(a,w)
  while w<=N
    BIT[w] += a
    w += (w&-w)
  end
end

def sum(a)
  ret = 0
  w = a
  while w>0
    ret += BIT[w]
    w -= (w&-w)
  end
  return ret
end


n,k=gets.split.map(&:to_i)
a=(1..n).map{gets.to_i}
b=a.inject([0]){|s,r|s<<(s[-1]+r-k)}[1..-1]

b2=b.map{|i|b.sort.index(i)}

