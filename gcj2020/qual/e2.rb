(1..gets.to_i).each{|no|
  n,k=gets.split.map(&:to_i)
  all = (1..n).map{|i|[*1..n].rotate(i)}
  memo={[*0...n]=>{0=>[]}}
  n.times{|i|
    newmemo = Hash.new{|h,k|h[k]={}}
    memo.each{|set,h|
      set.each{|r|
        h.each{|v,l|
          newmemo[set-[r]][v+all[r][i]]=l+[r]
        }
      }
    }
    memo = newmemo
    #p memo
  }


  if ans=memo[[]][k]
    ans = ["POSSIBLE",*ans.map{|i|all[i]*" "}]*"\n"
  else
    ans = "IMPOSSIBLE"
  end
  puts "Case ##{no}: #{ans}"
}
