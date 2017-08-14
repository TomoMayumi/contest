require 'pp'
gets.to_i.times{|t|
  n,q = gets.split.map(&:to_i)
  horse = [0]+(1..n).map{gets.split.map(&:to_i)}
  dist = [0]+(1..n).map{[0]+gets.split.map(&:to_i)}
  tar = (1..q).map{gets.split.map(&:to_i)}
  inf = 1.0/0

  table = (0..n).map{[inf]*(n+1)}

  (1..n).each{|i|
    table[i][i] = 0
    enagy,speed = horse[i]
    cur = i
    time = 0
    while cur < n && enagy >= dist[cur][cur+1]
      enagy -= dist[cur][cur+1]
      time += dist[cur][cur+1]*1.0/speed
      table[i][cur+1] = time
      cur += 1
    end
  }

  res = []
  res[n] = 0
  (1...n).reverse_each{|i|
    
    res[i]= (i+1..n).map{|j|table[i][j]+res[j]}.min
  }
  p res if res[1] == inf
  result = res[1]
  puts "Case ##{t+1}: #{result}"
}
