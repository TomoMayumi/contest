n=gets.to_i
list=Hash.new(0)
n.times{
    a,b=gets.split.map(&:to_i)
    list[a]+=1
    list[b+1]-=1
}

t=(1..gets.to_i).map{gets.to_i}
t.each{|ti|
    list[ti]+=0
}

newlist={0=>0}
cnt=0
list.sort.each{|k,v|
    cnt+=v
    newlist[k]=cnt
}

puts t.map{|ti|
    newlist[ti]
}
