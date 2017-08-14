a,(db,),b,(dc,),c=$<.map{|l|l.split.map &:to_i}

q=[*a,0]
while q[0]
  t,h,o,n=q.shift
  [[db,*b],[dc,*c]].each{|td,tt,th,to|
     
    
