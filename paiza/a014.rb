require 'pp'
h,w,n=gets.split.map(&:to_i)
m=[[?.]*(w+2)+[nil]]+(1..h).map{[?.]+gets.split+[?.,nil]}+[[?.]*(w+2)+[nil]]+[[nil]*(w+2)]
n.times{
  a1,b1,a2,b2=gets.split.map(&:to_i)
  if m[a1][b1]!=m[a2][b2]
    puts "no"
    next
  end
  # 1
  u1=a1; u1-=1 while m[u1-1][b1] == ?.
  d1=a1; d1+=1 while m[d1+1][b1] == ?.
  l1=b1; l1-=1 while m[a1][l1-1] == ?.
  r1=b1; r1+=1 while m[a1][r1+1] == ?.
  # 2
  u2=a2; u2-=1 while m[u2-1][b2] == ?.
  d2=a2; d2+=1 while m[d2+1][b2] == ?.
  l2=b2; l2-=1 while m[a2][l2-1] == ?.
  r2=b2; r2+=1 while m[a2][r2+1] == ?.
  # 縦縦
  if ([*u1..d1] & [*u2..d2]).any?{|y|
    c1,c2=[b1,b2].sort
    (c1+1..c2-1).all?{|x|
      m[y][x]==?.
    }
  }
    puts "yes"
    next
  end
  # 横横
  if ([*l1..r1] & [*l2..r2]).any?{|x|
    c1,c2=[a1,a2].sort
    (c1+1..c2-1).all?{|y|
      m[y][x]==?.
    }
  }
    puts "yes"
    next
  end
  # 縦横
  if (u1..d1).map{|y|[y,b1]} & (l2..r2).map{|x|[a2,x]} != []
    puts "yes"
    next
  end
  # 横縦
  if (l1..r1).map{|x|[a1,x]} & (u2..d2).map{|y|[y,b2]} != []
    puts "yes"
    next
  end
  puts "no"
}