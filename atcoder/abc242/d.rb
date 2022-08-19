tb="ABC"
s=gets.chomp.chars.map{|c|tb.index(c)}
gets.to_i.times{
    t,k=gets.split.map(&:to_i)
    m=k-1
    ofs=t
    t.times{|i|
        ofs+=1 if m.odd?
        m/=2
        break if m==0
    }
    puts tb[(s[m]+ofs)%3]
}
