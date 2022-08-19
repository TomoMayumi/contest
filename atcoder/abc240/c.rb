n,x=gets.split.map(&:to_i)
ab=(1..n).map{gets.split.map(&:to_i)}
d=ab.map(&:first).inject(:+)
able=[d]
ab.each{|a,b|
    able |= able.map{|i|i-a+b}
}
puts able.include?(x)? "Yes" : "No"