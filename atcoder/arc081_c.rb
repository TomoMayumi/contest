n=gets.to_i
s=gets.split.map(&:to_i)

t=s.group_by{|i|i}.flat_map{|i,j|[i]*(j.size/2)}.sort.reverse
if t.size>1
  p t[0]*t[1]
else
  p 0
end