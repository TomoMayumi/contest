n,k,d=gets.split.map(&:to_i)
a=gets.split.map.with_index{|s,i|[s.to_i,i]}
margin = n - (d*(k-1)+1)
if margin < 0
    p -1
    exit
end
margins=a.take(margin+1).sort
ridx=margin
lidx=0
ans=k.times.map{
    min,nextlidx=margins.shift
    nextlidx+=d
    margins.select!{|v,vi|vi>=nextlidx}
    nextridx=ridx+(nextlidx-lidx)
    (a[[ridx+1,nextlidx].max..nextridx]||[]).each{|an,ai|
        margins.insert(margins.bsearch_index{|v,vi|v>an}||-1,[an,ai])
    }
    ridx=nextridx
    lidx=nextlidx
    min
}
puts ans*" "
#未完成