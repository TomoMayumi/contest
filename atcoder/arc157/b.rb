n,k=gets.split.map(&:to_i)
s=gets.chomp
ss=s.dup

(0..n-3).each{|i|
    break if k<=0
    if s[i,3]=="YXY"
        s[i+1]="Y"
        k-=1
    end
}
(0..n-1).each{|i|
    break if k<=0
    if s[i]=="X"
        s[i]="Y"
        k-=1
    end
}

if ss[0]=="Y" && k>0
    ss[0]="X"
    k-=1
end
if ss[n-1]=="Y" && k>0
    ss[n-1]="X"
    k-=1
end
(0..n-3).each{|i|
    break if k<=0
    if ss[i,3]=="XYX"
        ss[i+1]="X"
        k-=1
    end
}