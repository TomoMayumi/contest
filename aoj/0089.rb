#*a=0
#a=0,*(b=eval"[#$_]").map.with_index{|n,i|n+a[a[b.size]?i+1:i,2].max}while gets
#p a[1]

#p $<.inject([0]){|s,r|[0,*(t=eval"[#{r}]").map.with_index{|n,i|n+s[s[t.size]?i+1:i,2].max}]}[1]
#p $<.inject([0]){|s,r|[0,*(t=r.split ?,).map.with_index{|n,i|n.to_i+s[s[t.size]?i+1:i,2].max}]}[1]
#p $<.inject([0]){|s,r|[0,*r.split(?,).map.with_index{|n,i|n.to_i+s[s[1+r.count(?,)]?i+1:i,2].max}]}[1]
#p $<.inject([0]){|s,r|[a=0,*(t=eval"[#{r}]").map{|n|a+=1;n+s[s[t.size]?a:a-1,2].max}]}[1]
#p $<.inject([0]){|s,r|[a=0]+(t=eval"[#{r}]").map{|n|a+=1;n+s[s[t.size]?a:a-1,2].max}}[1]
p$<.inject([0]){|s,r|t=eval"[#{r}]";[a=0]+t.map{|n|a+=1;n+s[s[t.size]?a:a-1,2].max}}[1]
#p $<.inject([]){|s,r|t=eval"[#{r}]";t.zip(s+[0],s[t.size]?s[1,99]:[0]+s).map{|n,x,y|n+[x,y].max}}
#p $<.inject([]){|s,r|t=eval"[#{r}]";t.zip(s[t.size]?s[1,99].zip(s):([0]+s).zip(s+[0])).map{|n,x,y|n+[x,y].max}}
#a=(b=eval"[#{$_}]").map.with_index{|n,i|n+[a[i]||0,a[(a.size>b.size)?i+1:i<1?0:i-1]||0].max}while gets
#p *$<.inject([]){|s,r|i=0;(b=eval"[#{r}]").map{|n|i+=1;n+(s[s[b.size]?i-1:i<2?0:i-2,2].max||0)}}
#p *$<.inject([]){|s,r|t=eval"[#{r}]";(s[t.size]?s:[0,*s,0]).each_cons(2).zip(t).map{|u,v|u.max+v}}
#p *$<.inject([]){|s,r|t=eval"[#{r}]";w=(s[t.size]?s:[0,*s,0]);t.zip(w,w[1..-1]).map{|u,v,w|u+[v,w].max}}
#p *$<.inject([]){|s,r|eval"t=[#{r}];w=(s[t.size]?s:[0,*s,0]);t.zip(w,w[1..-1]).map{|u,v,w|u+[v,w].max}"}
#puts $<.inject{|s,r|eval("t=[#{r}];s=[#{s}];w=(s[t.size]?s:[0,*s,0]);t.zip(w,w[1..-1]).map{|u,v,w|u+[v,w].max}")*?,}

#a=[]
#a=(a[(b=eval"[#$_]").size]?a:[0,*a,0]).each_cons(2).zip(b).map{|i,j|i.max+j}while gets

#a=(b=eval"[#$_]").zip(a+[0],a[b.size]?a[1,99]:[0]+a).map{|i,j,k|i+[j,k].max}while gets

#a=(b=eval"[#$_]").zip([*a,0],a[b.size]?[*a[1,],0,0]:[0,*a]).map{|i,j,k|i+[j,k].max}while gets
#p *a

