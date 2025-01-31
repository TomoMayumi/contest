n,q=gets.split.map(&:to_i)
s=gets.chomp
data=[0]
sum=0
s.chars.each_cons(2){|a,b|
    sum += 1 if a==b
    data << sum
}

q.times{
    l,r=gets.split.map(&:to_i)
    p data[r-1]-data[l-1]
}