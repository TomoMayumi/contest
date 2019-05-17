n=gets.to_i
d=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)

oisi = [0]*n
lost = [0]*n

n.times{|i|
  ([0,i-d[i]].max..[n-1,i+d[i]].min).each{|j|
    lost[j] += a[i] if i!=j
  }
}

sum = 0

left = [*0...n]

while left[0]
  t = left.sort_by!{|i|lost[i]}.shift
  sum += oisi[t]
  ([0,t-d[t]].max..[n-1,t+d[t]].min).each{|j|
    lost[j] -= a[t]
    oisi[j] += a[t]
  }
end

p sum



#n=gets.to_i
#d=gets.split.map(&:to_i)
#a=gets.split.map(&:to_i)
#
#oisi = [0]*n
#lost = [0]*n
#
#n.times{|i|
#  ([0,i-d[i]].max..[n-1,i+d[i]].min).each{|j|
#    lost[j] += a[i] if i!=j
#  }
#}
#
#sum = 0
#
#left = [*0...n]
#
#while left[0]
#  t = left.sort_by!{|i|lost[i]}.shift
#  sum += oisi[t]
#  ([0,t-d[t]].max..[n-1,t+d[t]].min).each{|j|
#    lost[j] -= a[t]
#    oisi[j] += a[t]
#  }
#end
#
#p sum
#
