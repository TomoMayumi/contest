h,w,r,c=gets.split.map(&:to_i)
n=gets.to_i

rh=Hash.new{|s,k|s[k]=[0,w+1]}
ch=Hash.new{|s,k|s[k]=[0,h+1]}
(1..n).each{
    ri,ci=gets.split.map(&:to_i)
    rh[ri] << ci
    ch[ci] << ri
}
rh.values.each(&:sort!)
ch.values.each(&:sort!)

rr=Hash.new{|s,k|s[k]=[w+1,0]}
cr=Hash.new{|s,k|s[k]=[h+1,0]}
rh.each{|k,v|rr[k]=v.reverse}
ch.each{|k,v|cr[k]=v.reverse}

#p rh,ch
gets.to_i.times{
    d,l=gets.split
    l=l.to_i

    case d
    when ?L
        wall=rr[r].bsearch{|ci|c>ci}
        c=[c-l,wall+1].max
    when ?R
        wall=rh[r].bsearch{|ci|c<ci}
        c=[c+l,wall-1].min
    when ?U
        wall=cr[c].bsearch{|ri|r>ri}
        r=[r-l,wall+1].max
    when ?D
        wall=ch[c].bsearch{|ri|r<ri}
        r=[r+l,wall-1].min
    end
    puts [r,c]*" "
}
