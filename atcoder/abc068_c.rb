#$N=<>;print!grep($a[$i=<>=~$"-$`?$'==$N&&$`:$']++&&$i,1..2e5)&&IM,POSSIBLE
#n,*z=$<.map &:split;puts"#{z.find{|a,b|[a,z.to_h[b]]==[?1,n[0]]}?"":"IM"}POSSIBLE"
#n,*z=$<.map &:split;puts"#{z.find{|a,b|a==?1&&z.to_h[b]==n[0]}?"":"IM"}POSSIBLE"
#n,*z=$<.map &:split;y=z.to_h;puts"#{z.all?{|a,b|a>?1||y[b]!=n[0]}?:IM:""}POSSIBLE"
(n,),*z=$<.map &:split;y=z.to_h;print z.all?{|a,b|a>?1||y[b]!=n}?:IM:"",:POSSIBLE