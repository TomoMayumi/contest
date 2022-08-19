m=998244353
gets.to_i.times{
    n=gets.to_i
    s=gets.chomp.chars.map{|c|c.ord-?A.ord}
    ans= s[0..n/2].inject{|a,si|
        (a*26+si)%m
    }
    if s.zip(s[0..n/2]+s[0,n/2].reverse).all?{|x,y|x>=y}
        ans+=1
    end
    p ans
}