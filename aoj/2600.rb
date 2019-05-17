N,W,H=gets.split.map(&:to_i)

hori = [0]*(W+1)
vert = [0]*(H+1)

N.times{
  x,y,w=gets.split.map(&:to_i)
  hori[[x-w,0].max] += 1
  hori[[x+w,W].min] -= 1
  vert[[y-w,0].max] += 1
  vert[[y+w,H].min] -= 1
}


t = 0
W.times{|i|
  hori[i] = ( t += hori[i] )
}
t = 0
H.times{|i|
  vert[i] = ( t += vert[i] )
}

puts (hori[0..-2].all?{|i|i>0}||vert[0..-2].all?{|i|i>0})?"Yes":"No"

p hori,vert
