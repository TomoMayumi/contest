m=*$<.map{|s|s.chomp.chars.map{|c|c=="#"}}.each_slice(4)
if m.sum{|mm|mm.sum{|l|l.count(true)}} != 16
    puts "No"
    exit
end
pat = m.map{|mm|
    pattern = [mm]
    if mm.all?{|l|!l[0]}
        pattern << mm.map{|l|l[1..3]+[false]}
        if mm.all?{|l|!l[1]}
            pattern << mm.map{|l|l[2..3]+[false]*2}
            if mm.all?{|l|!l[2]}
                pattern << mm.map{|l|l[3..3]+[false]*3}
            end
        end
    end
    if mm.all?{|l|!l[3]}
        pattern << mm.map{|l|[false]+l[0..2]}
        if mm.all?{|l|!l[2]}
            pattern << mm.map{|l|[false]*2+l[0..1]}
            if mm.all?{|l|!l[1]}
                pattern << mm.map{|l|[false]*3+l[0..0]}
            end
        end
    end
    tmp = pattern.dup
    if mm[0].all?{|c|!c}
        pattern.push( *tmp.map{|mmm|mmm[1..3]+[[false]*4]} )
        if mm[1].all?{|c|!c}
            pattern.push( *tmp.map{|mmm|mmm[2..3]+[[false]*4]*2} )
            if mm[2].all?{|c|!c}
                pattern.push( *tmp.map{|mmm|mmm[3..3]+[[false]*4]*3} )
            end
        end
    end
    if mm[3].all?{|c|!c}
        pattern.push( *tmp.map{|mmm|[[false]*4]+mmm[0..2]} )
        if mm[2].all?{|c|!c}
            pattern.push( *tmp.map{|mmm|[[false]*4]*2+mmm[0..1]} )
            if mm[1].all?{|c|!c}
                pattern.push( *tmp.map{|mmm|[[false]*4]*3+mmm[0..0]} )
            end
        end
    end
    pattern
}
pat[1].push(
    *pat[1].map{|mm|mm.transpose.map(&:reverse)},
    *pat[1].map{|mm|mm.reverse.map(&:reverse)},
    *pat[1].map{|mm|mm.transpose.reverse}
)
pat[2].push(
    *pat[2].map{|mm|mm.transpose.map(&:reverse)},
    *pat[2].map{|mm|mm.reverse.map(&:reverse)},
    *pat[2].map{|mm|mm.transpose.reverse}
)
ans = "No"
pat[0].product(pat[1],pat[2]){|a,b,c|
    if (0..3).all?{|i|(0..3).all?{|j|a[i][j]||b[i][j]||c[i][j]}}
        ans = "Yes"
        break
    end
}
puts ans