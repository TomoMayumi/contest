n,k=gets.split.map(&:to_i)
a0,*a=gets.split.map(&:to_i)
a=a.map{|ai|ai-a0}

min=1.0*a[-1]/(n-1)
divs=(1..Math.sqrt(a[0])).select{|i|a[0]%i==0}
divs += divs.map{|i|a[0]/i}.reverse
divs = divs.uniq.drop_while{|div|div<min}
#p [a,divs,min]
a.each{|ai|
    divs=divs.select{|d|ai%d==0}
}
p divs.count
puts divs*" "