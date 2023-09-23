m=gets.split[1].to_i
p gets.split
.each_with_object([0]){|ai,o|o<<(o[-1]+ai.to_i)%m}
.group_by{|i|i}
.values
.map{|i|i=i.size;i*(i-1)/2}
.inject(:+)