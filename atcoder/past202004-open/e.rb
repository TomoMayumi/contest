n=gets.to_i
a=[0]+gets.split.map(&:to_i)
b=[0]
(1..n).each{|i|
    next if b[i]
    cnt=1
    list=[i]
    x=a[i]
    until x==i
        cnt+=1
        list << x
        x=a[x]
    end
    list.each{|j|
        b[j]=cnt
    }
}
puts b[1..-1]*" "