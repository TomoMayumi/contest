n=gets.to_i
s=$<.map{|s|s.count('o')}
puts (1..n).sort_by{|i|[-s[i-1],i]}*" "