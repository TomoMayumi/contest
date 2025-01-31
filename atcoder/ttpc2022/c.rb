n,*ae=$<.read.split.map(&:to_i)
all=(0...n*5).sort_by{|i|ae[i]}.map{|i|[ae[i],i/n]}

right = [n,n,n,n,n]
left = [0,0,0,0,0]
sum = 0
all.each{|i,t|
    left[t]+=1
    l=left.dup
    l.delete_at(t)
    l0,l1,l2,l3=l

    right[t]-=1
    r=right.dup
    r.delete_at(t)
    r0,r1,r2,r3=r

    t = l0*((l1*r2 + r1*l2)*r3 + r1*r2*l3) + r0*(l1*l2*r3 + (l1*r2 + r1*l2)*l3)
    t %= 998244353
    sum = (sum + t * i)%998244353
}
p sum

__END__
P,N,*Z = 998244353,*$<.read.split.map(&:to_i)

hiA = hiB = hiC = hiD = hiE = N
loA = loB = loC = loD = loE = 0
eval p 'F5='+'ABCDE'.bytes.map{|a|
	updf = %[hi%1$c -= 1; lo%1$c += 1]
	sumf = %[hiB*hiC*loD*loE]
	bcde = ('ABCDE'.bytes-[a]).permutation.select{|b,c,d,e|
		b<c && d<e
	}.map{|bcde|
		bcde.map(&:chr)*''
	}
	upd = updf%a
	sum = bcde.map{|bcde|
		sumf.tr'B-E',bcde
	}*?+
	next %[lambda{#{upd};#{sum}}]
}*?,

p Z.size.times.sort_by{|i| Z[i] }.sum{|i| Z[i]*F5[i/N][]%P }%P

F5=[
    lambda{
        hiA -= 1;
        loA += 1;
        hiB*hiC*loD*loE+hiB*hiD*loC*loE+hiB*hiE*loC*loD+hiC*hiD*loB*loE+hiC*hiE*loB*loD+hiD*hiE*loB*loC
    },
    lambda{
        hiB -= 1;
        loB += 1;
        hiA*hiC*loD*loE+hiA*hiD*loC*loE+hiA*hiE*loC*loD+hiC*hiD*loA*loE+hiC*hiE*loA*loD+hiD*hiE*loA*loC
    },
    lambda{
        hiC -= 1;
        loC += 1;
        hiA*hiB*loD*loE+hiA*hiD*loB*loE+hiA*hiE*loB*loD+hiB*hiD*loA*loE+hiB*hiE*loA*loD+hiD*hiE*loA*loB
    },
    lambda{
        hiD -= 1;
        loD += 1;
        hiA*hiB*loC*loE+hiA*hiC*loB*loE+hiA*hiE*loB*loC+hiB*hiC*loA*loE+hiB*hiE*loA*loC+hiC*hiE*loA*loB
    },
    lambda{
        hiE -= 1;
        loE += 1;
        hiA*hiB*loC*loD+hiA*hiC*loB*loD+hiA*hiD*loB*loC+hiB*hiC*loA*loD+hiB*hiD*loA*loC+hiC*hiD*loA*loB
    }]
__END__