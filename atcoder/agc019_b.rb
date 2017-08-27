a=gets.chomp

p a.size*(a.size-1)/2+1-a.each_char.group_by{|a|a}.map{|k,v|v.size*(v.size-1)/2}.inject(:+)