def f;gets.split.map &:to_i;end
while (n = gets.to_i)>0
    b={}
    (1..n).map{
        i,*z=f
        b[i]=z
    }
    f[0].times{
        s,g=f
        c={s=>[0,[s]]}
        (t=c.flat_map{|k,(v,l)|
            b.map{|i,(x,y)|
                c[i]||(d=Math.hypot x-b[k][0],y-b[k][1])>50?nil:[d+v,l+[i]]
            }
        }.compact.min)?(c[t[1][-1]]=t):break until c[g]
    puts c[g]?c[g][1]*" ":"NA"
    }
end