(1..gets.to_i).each{|no|
  r,c=gets.split.map(&:to_i)
  s=(1..r).map{gets.split.map(&:to_i)+[nil]}+[[nil]*(c+2)]
  flag = true
  score = 0
  while flag
    flag=false
    s2=s.map{|a|a.dup}
    (0...r).each{|i|
      (0...c).each{|j|
        score += s[i][j]
        nei=[]
        nei << s[(i-1).step(-1,-1).find{|ii|s[ii][j]!=0}][j]
        nei << s[(i+1).step(r,1).find{|ii|s[ii][j]!=0}][j]
        nei << s[i][(j-1).step(-1,-1).find{|jj|s[i][jj]!=0}]
        nei << s[i][(j+1).step(c,1).find{|jj|s[i][jj]!=0}]
        nei.compact!
        sum=nei.inject(:+)
        if s[i][j]!=0&&sum&&(sum*1.0/nei.size)>s[i][j]
          s2[i][j]=0
          flag=true
        end
      }
    }
    s=s2
  end

  puts "Case ##{no}: #{score}"
}
