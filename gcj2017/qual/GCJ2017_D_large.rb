
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
  org = grid.map{|a|a.dup}

  (0..grid.size-1).each{|col|
    next if grid[0][col] == "+" || grid[0][col] == "o"
    if (0..grid.size-1).all?{|col2|
      raw = (col-col2).abs
      grid[raw][col2] != "+" && grid[raw][col2] != "o"
    }
      if grid[0][col] == "x"
        grid[0][col] = "o"
      else
        grid[0][col] = "+"
      end
    end
  }
  (1..grid.size-2).each{|col|
    if (0..grid.size-1).all?{|col2|
      raw = (grid.size-1) - (col-col2).abs
      grid[raw][col2] != "+" && grid[raw][col2] != "o"
    }
      if grid[grid.size-1][col] == "x"
        grid[grid.size-1][col] = "o"
      else
        grid[grid.size-1][col] = "+"
      end
    end
  }
  raw = 0
  (0..grid.size-1).each{|col|
    next if grid.any?{|a|a[col]=="x" || a[col]=="o"}
    while grid[raw].include?("x") || grid[raw].include?("o")
      raw += 1
    end
    if grid[raw][col] == "+"
      grid[raw][col] = "o"
    else
      grid[raw][col] = "x"
    end
  }

  list = []
  (0..grid.size-1).each{|r|
    (0..grid.size-1).each{|col|
      if grid[r][col] != org[r][col]
        list << "#{grid[r][col]} #{r+1} #{col+1}"
      end
    }
  }
  puts "Case ##{pnum+1}: #{points(grid)} #{list.size}"
  puts list
  #puts check(grid)
}
