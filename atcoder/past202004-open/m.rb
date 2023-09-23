d,l,n=gets.split.map(&:to_i)
h=Hash.new{|h,k|h[k]=[]}
gets.split.each_with_index{|s,i|
    h[s.to_i] << i
}
h.keys.each{|k|
    h[k] << h[k][0]+d
    h[k] = h[k].each_cons(2).map{|a,b|[a,(b-a-1)/l]}
}
n.times{
    k,f,t=gets.split.map(&:to_i)
    if h[k]==[]
        p 0
        next
    end
    start = h[k].drop_while{|a,c|a<f}
    cnt=0
    print [t,cnt]
    if !start[0]
        t-=1+(h[k][0][0]+d-f-1)/l
    elsif start[0][0]!=f
        t-=1+(start[0][0]-f-1)/l
    end
    print [t,cnt]
    start.each{|a,c|
        break if t<=0
        cnt+=1
        t-=c+1
    }
    print [t,cnt]
    div,mod=[t,0].max.divmod(h[k].sum{|a,c|c+1})
    cnt+=div*h[k].size
    h[k].each{|a,c|
        break if t<=0
        cnt+=1
        t-=c+1
    }
    print [t,cnt]
    print [div,mod,start]
    p cnt
}
#未完成