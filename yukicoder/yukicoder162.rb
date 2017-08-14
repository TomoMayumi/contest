N=80-gets.to_i
P=gets.split.map{|i|1-i.to_i/1e2}
r=*0..14
p N.times.inject(r){|s,|
  r.map{|n|
    p=n<1?[0,0]:n<2?[0,P[0],0]:[0,P[1],*[P[2]]*(n-2),P[1],0]
    [*1..n].repeated_combination(2).inject(0){|t,(i,j)|
      t+(i..j).inject(s[j-i+1]*(1-p[i-1])*(1-p[j+1])){|u,k|
        u*p[k]
      }
    }
  }
}[-1]*2


__END__
A=80-gets.to_i
P=gets.split.map{|i|1-i.to_i/100.0}
t=[0]+[1]*14+[0]
A.times{
#  p t
  t=[0]+t.each_cons(3).map{|i,j,k|
    j*(i*k*P[2]+(1-i)*(1-k)*P[0]+(1-i*k-(1-i)*(1-k))*P[1])
  }+[0]
}
p t.inject(:+)*2
