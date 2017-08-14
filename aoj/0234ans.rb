### constant
 
MAX_INT = (1 << 30)
 
### global variables
 
$mccache = []
$hmoves = []
 
### subroutines
 
def hmoves(x0, x1)
  hmvs = []
 
  for xi in (0...$w)
    hmv0 =
      (x0 == xi) ? [] :
      (x0 > xi) ? x0.downto(xi + 1).to_a : x0.upto(xi - 1).to_a
    hmv1 =
      (xi == x1) ? [x1] :
      (xi > x1) ? xi.downto(x1).to_a : xi.upto(x1).to_a
 
    hmv = hmv0 + hmv1
    hmvs << hmv if ! hmvs.include? hmv
  end
 
  hmvs.sort
end
 
def min_cost(x, y, o)
  return 0 if y >= $h
  return $mccache[x][y][o] if ! $mccache[x][y][o].nil?
  return ($mccache[x][y][0] = MAX_INT) if o <= 1
 
  min_cost = MAX_INT
 
  for xn in (0...$w)
    for hmv in $hmoves[x][xn]
      cost0 = 0
      o0 = o
      visited = $w.times.map{false}
      ok = true
 
      for x1 in hmv
        o0 -= 1
        if o0 <= 0
          ok = false
          break
        end
 
        if ! visited[x1]
          l = $layers[y][x1]
 
          if l > 0
            o0 += l
            o0 = $m if o0 > $m
          else
            cost0 += -l
          end
 
          visited[x] = true
        end
      end
 
      if ok && o0 > 0
        cost = cost0 + min_cost(x1, y + 1, o0)
        min_cost = cost if min_cost > cost
      end
    end
  end
 
  $mccache[x][y][o] = min_cost
end
 
### main
 
while true
  $w, $h = gets.strip.split(' ').map{|s| s.to_i}
  break if $w == 0 && $h == 0
 
  f, $m, o = gets.strip.split(' ').map{|s| s.to_i}
 
  $layers = []
 
  $h.times do
    $layers << gets.strip.split(' ').map{|s| s.to_i}
  end
  #p $layers
 
  $mccache= $w.times.map{$h.times.map{[]}}
  $hmoves = (0...$w).map{|x0| (0...$w).map{|x1| hmoves(x0, x1)}}
  #p $hmoves
 
  min_cost = MAX_INT
 
  for x in (0...$w)
    cost = min_cost(x, 0, o)
    min_cost = cost if min_cost > cost
  end
 
  puts (min_cost > f ? 'NA' : min_cost)
end