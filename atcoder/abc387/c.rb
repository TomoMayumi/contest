l,r=gets.split.map(&:to_i)

la=l.to_s.chars.map(&:to_i)
ra=r.to_s.chars.map(&:to_i)
if la.size < ra.size
    ans = 0
    dig = 0
    (1..la.size-1).each{|d|
        ans += [0,la[0]-la[-d]].max * (la[0]**(d-1))
        p [0,d,ans]
    }
    (la.size+1..ra.size-1).each{|d|
        (1..9).each{|dd|
            ans += dd**(d-1)
            p [1,d,dd,ans]
        }
    }
    (1...ra.size).each{|d|
        ans += [ra[-d]+1,ra[0]].min * (ra[0]**(d-1))
        p [2,d,ans]
    }
else
    ans = 0
end
p ans