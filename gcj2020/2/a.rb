(1..gets.to_i).each{|no|
  l,r=gets.split.map(&:to_i)
  if l>=r
    dif=l-r
    n=((1..dif).bsearch{|i|i*(i+1)/2>dif}||dif+1)-1
    l-=n*(n+1)/2
  else
    dif=r-l
    n=((1..dif).bsearch{|i|i*(i+1)/2>dif}||dif+1)-1
    r-=n*(n+1)/2
  end
  if l>=r
    n2=((1..l).bsearch{|i|i*(n+i)>l}||l+1)-1
    l-=n2*(n+n2)
    n3=((1..r).bsearch{|i|i*(n+1+i)>r}||r+1)-1
    r-=n3*(n+1+n3)
    n+=n2+n3
  else
    n2=((1..l).bsearch{|i|i*(n+1+i)>l}||l+1)-1
    l-=n2*(n+1+n2)
    n3=((1..r).bsearch{|i|i*(n+i)>r}||r+1)-1
    r-=n3*(n+n3)
    n+=n2+n3
  end
  puts "Case ##{no}: #{n} #{l} #{r}"
}
