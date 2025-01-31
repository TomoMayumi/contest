n,m=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)
ans=(1..m).map{{}}
a.each.with_index(1){|ai,da|
    first=1
    if ai<0
        dif=-ai/da
        first=dif
    end
    last=[(n-ai)/da+2,m].min
    (first..last).each{|i|
        aii=ai+da*i
        ans[i-1][aii]=true
    }
}
puts ans.map{|ansi|(0..n+1).find{|i|!ansi[i]}}