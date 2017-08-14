gets
puts$<.map{|e|w=g=r=f=0
e.chomp.bytes{|c|c==82?(r+=1
g<r&&break):c==71?(f=0
g+=1
w<g&&break):(w+=f=1)
}
g==r&&f<1?:possible: :impossible
}