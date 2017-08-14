def f(bed,cnt,left)
  return 1 if cnt == 10
  ret = 0
  left.each.with_index{|board,i|
    newleft = left.dup
    newleft.delete_at(i)
    if cnt%2==0
      c=cnt/2
      newbed=bed.map{|a|a.dup}
      newbed.each.with_index{|a,j|a[c]+=board[j]}
      if newbed.all?{|a|[2,3,5].include?(a[c])}
        ret += f(newbed,cnt+1,newleft)
      end
      newbed=bed.map{|a|a.dup}
      newbed.each.with_index{|a,j|a[c]+=board[4-j]}
      if newbed.all?{|a|[2,3,5].include?(a[c])}
        ret += f(newbed,cnt+1,newleft)
      end
    else
      r=cnt/2
      newbed=bed.map{|a|a.dup}
      newbed[r]=newbed[r].zip(board).map{|t,u|t+u}
      if newbed[r].all?{|t|[2,3,5].include?(t)}
        ret += f(newbed,cnt+1,newleft)
      end
      newbed=bed.map{|a|a.dup}
      newbed[r]=newbed[r].zip(board.reverse).map{|t,u|t+u}
      if newbed[r].all?{|t|[2,3,5].include?(t)}
        ret += f(newbed,cnt+1,newleft)
      end
    end
  }
  return ret
end


while (s=gets.chomp)!="END"
  boards=s.split.map{|t|t.chars.map{|c|c==?0?2:3}}
  bed = (0..4).map{[0]*5}
  p f(bed,0,boards)/(2**(3+boards.count{|a|a==a.reverse}))
end