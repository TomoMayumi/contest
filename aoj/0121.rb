neib = [[1,4],[0,2,5],[1,3,6],[2,7],[0,5],[1,4,6],[2,5,7],[3,6]]
goal = [0,1,2,3,4,5,6,7]

while gets
  l = $_.split.map(&:to_i)
  cost = {l=>0}
  q = [l]
  until cost[goal]
    t = q.shift
    zi = t.index(0)
    neib[zi].each{|i|
      tl = t.dup
      tl[zi] = tl[i]
      tl[i] = 0
      unless cost[tl]
        cost[tl] = cost[t] + 1
        q.push(tl)
      end
    }
  end
  p cost[goal]
end
