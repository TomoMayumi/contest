def f(memo,past,cnt,pipe,n)
  return past.size if cnt==10
  memo[[past.size,past[-n..-1],cnt]] ||= (0..n-1).map{|i|
    newpast=past+[false]*i
    unless newpast[-n]
      newpast[-n..-1] = newpast[-n..-1].zip(pipe).map{|a,b|a||b}
      f(memo,newpast,cnt+1,pipe,n)
    end
  }.compact.min||1e9
end

while (n=gets.to_i)>0
  pipe=(0..4).map{gets.chars.map{|c|c=="X"}}
  a=[true]+(1..n-1).map{|i|pipe.any?{|j|j[i..-1].zip(j).any?{|k,l|k&&l}}}
  p f({},a,1,a,n)
end