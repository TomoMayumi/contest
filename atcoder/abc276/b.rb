(n,m),*ab = $<.map{|l|l.split.map(&:to_i)}
ne=(0..n).map{[]}
ab.each{|a,b|
    ne[a] << b
    ne[b] << a
}

ne[1..-1].each{|z|
    puts [z.size,*z.sort]*" "
}
