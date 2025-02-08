n=gets.to_i
p=gets.split.map(&:to_i)
q=gets.split.map(&:to_i)
l=*q.zip(p)
puts l.map{|qi,pi|[qi,l[pi-1][0]]}.sort.map{|_,a|a}*" "