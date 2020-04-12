class Integer
  @@fa=[1,1,2]
  def fact
    (@@fa.size..self).each{|i|@@fa[i]=@@fa[i-1]*i}
    @@fa[self]
  end
  alias :! :fact
end

def nck(n,k)
  n.!/k.!/(n-k).!
end

(1..gets.to_i).each{|no|
  ans=[]
  n=gets.to_i
  i=0
  while (t=nck(i,i/2))<=n
    ans[i+1]=i/2+1
    n-=t
    i+=1
  end
  i-=1
  ans2 = []
  while i>0
    t=nck(i,i/2+1)
    if n>=t
      ans2[i+1]=i/2+((i.even?)? -1 : 1)+1
      n-=t
    end
    i-=1
  end
  ans3=[]
  (1..ans.size-1).each{|i|
    if ans2[i]
      ans3 << [i,ans2[i]]
    end
    ans3 << [i,ans[i]]
  }

  puts "Case ##{no}:\n#{ans3.map{|a|a*" "}*"\n"}"
}
