s=gets.chomp
l=s.size
p l-(1..l).find{|i|s[0,(l/2)-i]==s[(l/2)-i,(l/2)-i]}*2