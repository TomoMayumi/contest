n,x=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)

permutations = (0..9999).map{|i|
    i.to_s.chars.permutation.map{|a|
        a.join.to_i
    }
}

maxi = (0..9999).map{|i|
    i.to_s.chars.sort.reverse.join.to_i
}

l=[-1]*10000
l[maxi[x]]=0
a.each{|ai|
    tl=l.dup
    l.each_with_index{|c,li|
        next if c<0
        c += 1
        permutations[li].each{|lp|
            t=lp-ai
            if t>=0
                tt=maxi[t]
                tl[tt] = c if tl[tt] < c
            end
        }
    }
    l=tl
}

p l.max