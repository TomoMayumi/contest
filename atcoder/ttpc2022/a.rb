require 'prime'

x,y=gets.split.map(&:to_i)
x-=2015
y-=2015
#p [x,y,x.gcd(y),x.gcd(y).prime_division]
puts x.
    gcd(y).
    prime_division.
    inject([1]){|s,(b,n)|
        #p [s,b,n]
        s.
            product((0..n).map{|i|b**i}).
            map{|a|a.inject(:*)}
    }.sort.uniq