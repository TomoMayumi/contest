probnum = 1

while (n=gets.to_i)>0
  map = {}

  n.times{
    x,y,r = gets.split.map(&:to_f)
    map[x-r] ||= []
    map[x-r] << [y-r,y+r,1]
    map[x+r] ||= []
    map[x+r] << [y-r,y+r,-1]
  }

  ans = 0

  prei = 0
  sum = 0

  line = {}
  map.keys.sort.each{|i|
    #p [sum*(i-prei),map[i],i,sum]
    ans += sum*(i-prei)

    map[i].each{|s,e,j|
      line[s] ||= 0
      line[s] += j
      line[e] ||= 0
      line[e] -= j
    }

    sum = 0
    cnt = 0
    ind = 0
    line.keys.sort.each{|j|
      if cnt > 0
        sum += j-ind
      end
      cnt += line[j]
      ind = j
    }

    prei = i
  }

  puts "%d %.2f"%[probnum,ans]
  probnum += 1
end