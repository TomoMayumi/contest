(1..gets.to_i).each{|no|
  x,y=gets.split.map(&:to_i)
  ans = []
  if x.abs>y.abs
    c= x<0? ?W:?E
    (x.to_s(2).length-1).downto(0){|i|
      if x[i]==1
        ans[i]=c
      else
        if y<0
          ans[i]=?N
          y+=2**i
        else
          ans[i]=?S
          y-=2**i
        end
      end
    }
  else
    x,y=y,x
    c= x<0? ?S:?N
    (x.to_s(2).length-1).downto(0){|i|
      if x[i]==1
        ans[i]=c
      else
        if y<0
          ans[i]=?E
          y+=2**i
        else
          ans[i]=?W
          y-=2**i
        end
      end
    }
  end
  p [ans,x,y]
  ans=["IMPOPSSIBLE"] unless y==0
  puts "Case ##{no}: #{ans*""}"
}
