n,m=gets.split.map(&:to_i)

base = 0
ans = ["-1",1]
(1..n).each{|i|
    base=(base*10+1)%m
    (1..9).each{|j|
        ans=["#{j}",i] if (base*j)%m==0
    }
}
puts ans[0]*ans[1]