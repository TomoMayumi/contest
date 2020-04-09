def g(i)
  p i
  STDOUT.flush
  gets.to_i
end

def debug(s)
  #open("err.txt","a"){|f|
  #  f.puts s.inspect
  #}
end

t,b=gets.split.map(&:to_i)
t.times{
  ans=[]
  qcnt=0
  eq=nil
  ne=nil
  (1..b/2).each{|i|
    debug [i,ans]
    if qcnt>=10
      if eq
        if ans[eq]!=g(eq)
          ans=[nil]+ans[1..-1].map{|i|i&&(1-i)}
        end
      else
        g(1)
      end
      if ne
        if ans[ne]!=g(ne)
          ans=[nil]+ans[1..-1].reverse
        end
      else
        g(1)
      end
      qcnt=2
    end

    j=b+1-i
    ans[i]=g(i)
    ans[j]=g(j)
    qcnt+=2
    if ans[i]==ans[j]
      eq=i
    else
      ne=i
    end
  }

  puts ans[1..b]*""
  STDOUT.flush
  break if gets[0]!=?Y
}