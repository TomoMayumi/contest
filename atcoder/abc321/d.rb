n,m,q=gets.split.map(&:to_i)
a=gets.split.map(&:to_i).sort
b=gets.split.map(&:to_i).sort
binj=[0]
b.each{|bi|binj << binj[-1]+bi}
bi=m-1
sum=0
a.each{|av|
    bi -= 1 until bi == -1 || b[bi]+av < q 
    sum += (m-1-bi)*q + binj[bi+1] + av*(bi+1)
}
p sum