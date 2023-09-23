n=gets.to_i
r=(1..n-1).map{gets.split.map(&:to_i)}

state=[1]+[0]*(n-2)+[2]
root=(r+r.map{|a,b|[b,a]}).group_by{|a,b|a}.sort_by{|k,v|k}.map{|k,v|v.map{|a,b|b-1}}

fen=root[0]
snu=root[-1]
while fen[0]||snu[0]
  fen=fen.select{|i|state[i]==0}.flat_map{|i|state[i]=1;root[i]}
  snu=snu.select{|i|state[i]==0}.flat_map{|i|state[i]=2;root[i]}
end

puts state.count(1)>n/2?"Fennec":"Snuke"
