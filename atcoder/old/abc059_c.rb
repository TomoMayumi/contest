gets
n = gets.split.map(&:to_i)

i = 0
a1 = n.inject([0,0]){|(sum,dif),r|
  sum += r
  if i%2==0
    if sum <= 0
      dif += 1-sum
      sum = 1
    end
  else
    if sum >= 0
      dif -= -1-sum
      sum = -1
    end
  end
  i += 1
  [sum,dif]
}[1]

i = 0
a2 = n.inject([0,0]){|(sum,dif),r|
  sum += r
  if i%2!=0
    if sum <= 0
      dif += 1-sum
      sum = 1
    end
  else
    if sum >= 0
      dif -= -1-sum
      sum = -1
    end
  end
  i += 1
  [sum,dif]
}[1]

p [a1,a2].min
