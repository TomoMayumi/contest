while gets
  s=$_.upcase.gsub(/[^A-Z]/,"")

  odd=(1..s.size-2).map{|i|
    j=1
    j+=1 while ( (i-j)>=0 && (i+j)<s.size && s[i-j]==s[i+j] )
    j-=1
    j==0?nil:s[i..i+j]
  }.uniq.compact.sort_by(&:size).inject([]){|s,r|
    s-(2..r.size-1).map{|i|r[0,i]}+[r]
  }.map{|s|s[1..-1].reverse+s}

  even=(0..s.size-2).map{|i|
    j=0
    j+=1 while ( (i-j)>=0 && (i+j+1)<s.size && s[i-j]==s[i+j+1] )
    j-=1
    j<=0?nil:s[i+1..i+j+1]
  }.uniq.compact.sort_by(&:size).inject([]){|s,r|
    s-(2..r.size-1).map{|i|r[0,i]}+[r]
  }.map{|s|s.reverse+s}

  puts (odd+even).join(" ")
end