n=gets
p gets.split.zip(?1..n).sum{|d,i|(?1..d).count{|e|(i+e).chars.uniq.size==1}}
