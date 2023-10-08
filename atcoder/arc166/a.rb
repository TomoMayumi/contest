def check x,y
    xb=x.count(?B)
    yb=y.count(?B)
    xctb = yb-xb
    xc=x.count(?C)
    if xc < xctb
        return false
    end
    (x.size-1).downto(0){|i|
        if x[i]==?C
            if xctb > 0
                x[i]=?B
                xctb-=1
            else
                x[i]=?A
            end
        end
    }
    bcnt=0
    (0...x.size).each{|i|
        if y[i]==?B
            if x[i]!=?B
                bcnt += 1
            end
        else
            if x[i]==?B
                bcnt -= 1
                if bcnt<0
                    return false
                end
            end
        end
    }
    return bcnt==0
end

gets.to_i.times{
    n,x,y=gets.split
    n=n.to_i
    ans=true
    start=0
    (0...n).each{|i|
        if y[i]==?C
            case x[i]
            when ?C
                if start<i
                    unless check x[start..i-1], y[start..i-1]
                        ans = false
                        break
                    end
                end
                start=i+1
            else
                ans=false
                break
            end
        end
    }
    if ans && start<n
        unless check x[start..n-1], y[start..n-1]
            ans = false
        end
    end
    puts ans ? "Yes" : "No"
}
