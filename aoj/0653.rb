map=[]
map[2020]=0
pieces=[]
gets
gets.split.map(&:to_i).each.with_index(1){|x,i|
  map[x]=i
  pieces[i]=x
}
gets
gets.split.map(&:to_i).each{|i|
  unless map[pieces[i]+1]
    map[pieces[i],2]=[nil,i]
    pieces[i]+=1
  end
}
puts pieces.drop(1)