n=gets.to_i
a=gets.split.map(&:to_i)
b=gets.split.map(&:to_i)
flag=false
(n-2).times{|i|
    idxs=(0...a.size).select{|j|a[j]==b[n-i-1]}
    idx=idxs[-1]
    flag||=idxs.any?{|i|(idx-i).odd?}
    break unless idx
    a.delete_at(idx)
    if (a.size-idx).odd?
        a[-2,2] = a[-2,2].reverse
    end
}
puts (b[0,2]==a)||(flag&&b[0,2]==a.reverse) ? "Yes" : "No"