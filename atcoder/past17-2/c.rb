n=gets.to_i
a=gets.split.map(&:to_i)
c=gets.split.map(&:to_i)
p a.sum{|ai|c[ai-1]}
