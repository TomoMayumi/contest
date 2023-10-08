n,m=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)
ans=(1..n).map{gets.chomp}
score=(1..n).map{|ni|
    sum=ni
    left=[]
    (0...m).each{|mi|
        if ans[ni-1][mi]=='o'
            sum += a[mi]
        else
            left << a[mi]
        end
    }
    [sum,left.sort.reverse]
}
max=score.map{|s,l|s}.max
#p [ans,score]
score.each{|s,l|
    cnt=0
    while s<max
        s+=l.shift
        cnt+=1
    end
    p cnt
}