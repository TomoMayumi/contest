n=gets.to_i
n.times{|i|
    a=gets.split.map(&:to_i).rotate(-i)
    puts a==a.sort ? "Yes" : "No"
}
