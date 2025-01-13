l,r=gets.split.map(&:to_i)

la=l.to_s.chars.map(&:to_i)
ra=r.to_s.chars.map(&:to_i)
if la.size < ra.size
    ans = 1
    (1..la.size).each{|d|
        ans += [0,la[0]-la[-d]-1].max * (la[0]**(d-1))
        p [0,d,ans]
    }
    (la[0]+1..9).each{|i|
        ans += i**(la.size-1)
        p [0,?a,ans]
    }

    (la.size+1..ra.size-1).each{|d|
        (1..9).each{|dd|
            ans += dd**(d-1)
            p [1,d,dd,ans]
        }
    }

    ans += 1
    (1...ra.size).each{|d|
        ans += [ra[-d],ra[0]].min * (ra[0]**(d-1))
        p [2,d,ans]
    }
    (1..ra[0]-1).each{|i|
        ans += i**(ra.size-1)
        p [2,?a,ans]
    }
else
    ans = 0
end
p ans