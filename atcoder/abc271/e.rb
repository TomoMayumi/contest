(n,m,k),*r,e=$<.map{_1.split.map &:to_i}
t=[1.0/0]*(n+1)
t[1]=0

e.each{|ei|
    a,b,c=r[ei-1]
    t[b]=[t[b],t[a]+c].min
}
p t[n].infinite? ? -1 : t[n]