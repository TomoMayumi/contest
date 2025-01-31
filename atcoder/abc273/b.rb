x,k=gets.split.map(&:to_i)
(0...k).each{|i|
    m=x%10
    x=x/10+m/5
}
p x*10**k