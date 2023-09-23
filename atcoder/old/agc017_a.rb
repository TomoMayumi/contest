n,tp=gets.split.map(&:to_i)
a=gets.split.map{|i|i.to_i%2}
odd=a.count(1)
even=a.count(0)
fl=(2..odd).inject([1,1]){|s,r|s<<(s[-1]*r)}
p (2**even)*tp.step(odd,2).inject(0){|s,r|s+fl[odd]/fl[r]/fl[odd-r]}
