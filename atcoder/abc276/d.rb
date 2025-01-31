n=gets.to_i
a1,*a=gets.split.map(&:to_i)
ans=0
a.each.with_index(2){|ai,i|
    if ai % a1 == 0
        ai /= a1
        while ai != 1
            ans += 1
            if i % 2 == 0 && ai % 2 == 0
                ai /= 2
            elsif i % 3 == 0 && ai % 3 == 0
                ai /= 3
            else
                p -1
                exit 0
            end
        end
    else
        p -1
        exit 0
    end
}
p ans