n,k=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)
r=[*0...n].select{|i|a[i]>0}
while k>r.size
    t=k/r.size
    r=r.select{|i|
        if a[i]>=t
            k-=t
            a[i]-=t
        else
            k-=a[i]
            a[i]=0
        end
        a[i]>0
    }
end
r.each{|i|
    break if k==0
    a[i]-=1
    k-=1
}
puts a*" "