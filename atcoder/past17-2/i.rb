require 'set'
n=gets.to_i
maxl=5
s=(1..n).map{gets.chomp}
h=(0..maxl).map{Hash.new{Set[]}}
s.each.with_index{|si,idx|
    h[si.size][si]+=Set[idx]
}
hh=(0..maxl).map{Hash.new{Set[]}}
ans=0
maxl.downto(1){|l|
#    p [ans,h,hh]
    p hh
    h[l].each{|k,v|
        ans+=v.size**2
        ans+=v.size*hh[l][k].size
        (0...l).each{|idx|
            t=k.dup
            t[idx]=""
            hh[l-1][t]+=v
        }
    }
    hh[l].each{|k,v|
        (0...l).each{|idx|
            t=k.dup
            t[idx]=""
            hh[l-1][t]+=v
        }
    }
}
#p [ans,h]
p ans