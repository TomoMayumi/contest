gets.to_i.times{|i|
    print "Case ##{i+1}: "
    ans = true

    gets
    t = gets.chomp.split

    single, multi = t.partition{|s|s.chars.uniq.size==1}

    ll = []
    while multi[0]
        s = multi.pop
        while (idx=single.index{|ss|ss[0]==s[0]})
            ss=single.delete_at(idx)
            s=ss+s
        end
        while (idx=single.index{|ss|ss[0]==s[-1]})
            ss=single.delete_at(idx)
            s=s+ss
        end
        while (idx=multi.index{|ss|ss[0]==s[-1]})
            ss=multi.delete_at(idx)
            s=s+ss
            while (idx=single.index{|ss|ss[0]==s[-1]})
                ss=single.delete_at(idx)
                s=s+ss
            end
        end
        while (idx=multi.index{|ss|ss[-1]==s[0]})
            ss=multi.delete_at(idx)
            s=ss+s
            while (idx=single.index{|ss|ss[0]==s[0]})
                ss=single.delete_at(idx)
                s=ss+s
            end
        end
        ll.push s
    end
    ret = (ll+single)*""
    lll = ret.chars.chunk(&:itself).map(&:first)
    ret = "IMPOSSIBLE" if lll != lll.uniq

    puts ret
}