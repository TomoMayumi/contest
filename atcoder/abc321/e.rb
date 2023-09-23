def calc n,x,k
    return 0 if k<0
    min=x*(2**k)
    max=min+(2**k)-1
    if n < min
        0
    elsif max > n
        n-min+1
    else
        (2**k)
    end
end

gets.to_i.times{
    n,x,k=gets.split.map(&:to_i)
    sum=calc(n,x,k)
    while x>1
        if x.odd?
            sum+=calc(n,x-1,k-2)
        else
            sum+=calc(n,x+1,k-2)
        end
        x/=2
        k-=1
        if k==0
            sum+=1
            break
        end
    end
    p sum
}
