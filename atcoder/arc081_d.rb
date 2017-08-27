n=gets.to_i
s=[0,1].map{gets.chomp}
pre_pattern=:none
cnt=1
i=0
while i<n
  case pre_pattern
  when :none
    if s[0][i]==s[1][i]
      x=3
      pre_pattern=:tate
    else
      x=6
      pre_pattern=:yoko
      i+=1
    end
  when :tate
    if s[0][i]==s[1][i]
      x=2
      pre_pattern=:tate
    else
      x=2
      pre_pattern=:yoko
      i+=1
    end
  when :yoko
    if s[0][i]==s[1][i]
      x=1
      pre_pattern=:tate
    else
      x=3
      pre_pattern=:yoko
      i+=1
    end
  end
  cnt = cnt*x%1000000007
  i+=1
end

p cnt