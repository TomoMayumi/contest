N,a,b,c=gets.split.map(&:to_i)
ab=a.lcm(b)
bc=b.lcm(c)
ca=c.lcm(a)
abc=ab.lcm(c)
A=gets.split.map(&:to_i)
am,bm,cm,abm,bcm,cam,abcm = [a,b,c,ab,bc,ca,abc].map{|m|
    result = []
    A.each.with_index{|i,j|
        mm=i%m
        result << [(mm==0)? 0 : m-mm,j]
        result = result.sort[0,3]
    }
    result
}
p [
    abcm[0][0],
    abm[0,2].product(cm[0,2]).select{|aa,bb|aa[1]!=bb[1]}.map{|aa,bb|aa[0]+bb[0]}.min||1e100,
    bcm[0,2].product(am[0,2]).select{|aa,bb|aa[1]!=bb[1]}.map{|aa,bb|aa[0]+bb[0]}.min||1e100,
    cam[0,2].product(bm[0,2]).select{|aa,bb|aa[1]!=bb[1]}.map{|aa,bb|aa[0]+bb[0]}.min||1e100,
    am[0,3].product(bm[0,3],cm[0,3]).select{|aa,bb,cc|aa[1]!=bb[1]&&bb[1]!=cc[1]&&cc[1]!=aa[1]}.map{|aa,bb,cc|aa[0]+bb[0]+cc[0]}.min||1e100,
].min