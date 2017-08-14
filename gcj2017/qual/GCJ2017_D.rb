require 'pp'


def points(grid)
  point = { "." => 0, "x" => 1, "+" => 1, "o" => 2 }
  return grid.flatten.inject(0){|s,i|s+point[i]}
end

def check(grid)
  # ‰¡
  if grid.any?{|a|a.count("x")+a.count("o")>1}
    return false
  end
  #c
  if grid.transpose.any?{|a|a.count("x")+a.count("o")>1}
    return false
  end
  #ŽÎ‚ß
  if grid.map.with_index{|a,i|(["."]*grid.size).insert(i,*a)}.transpose.any?{|a|a.count("+")+a.count("o")>1}
    return false
  end
  if grid.reverse.map.with_index{|a,i|(["."]*grid.size).insert(i,*a)}.transpose.any?{|a|a.count("+")+a.count("o")>1}
    return false
  end
  return true
end

t = gets.to_i

t.times{|pnum|
  n,m = gets.split.map(&:to_i)
  grid = (1..n).map{["."]*n}
  (1..m).each{
    type,r,c = gets.split
    r = r.to_i
    c = c.to_i
    grid[r-1][c-1] = type
  }
  p [pnum,grid.map{|i|i.join}.join("\n"),points(grid),check(grid)]

#  puts "Case ##{pnum+1}: #{max} #{min}"
}

grid = [
"....".chars.to_a,
"....".chars.to_a,
"....".chars.to_a,
"....".chars.to_a
]
#grid = [
#"...".chars.to_a,
#"...".chars.to_a,
#"...".chars.to_a
#]
def dfs(grid,i,j,max)
  return max unless check(grid)
  if i > grid.size-1
    point = points(grid)
    if max <= point
      max=point
      p [max,grid]
#      if max == (grid.size)*2
#        puts grid.map{|a|a*""}*"\n"
#        puts
#      end
    end
    return max
  end
  nexti = i
  nextj = j+1
  if nextj>grid.size-1
    nextj = 0
    nexti = i+1
  end
  max = dfs(grid,nexti,nextj,max)
  grid[i][j] = "x"
  max = dfs(grid,nexti,nextj,max)
  grid[i][j] = "+"
  max = dfs(grid,nexti,nextj,max)
  grid[i][j] = "o"
  max = dfs(grid,nexti,nextj,max)
  grid[i][j] = "."
  return max
end

p check(grid)

p 1
dfs(grid,0,0,0)