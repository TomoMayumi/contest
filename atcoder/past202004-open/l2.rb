n,k,d=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)
margin = n - (d*(k-1)+1)
if margin < 0
    p -1
    exit
end
lidx=0
ans=k.times.map{
    am = a[lidx,margin+1]
    min=am.min
    idx=am.index(min)
    margin -= idx
    lidx+=idx+d
    min
}
puts ans*" "
#TLE