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
  list = []
  point = n*2+[0,(n-2)].max
  if grid[0].include?("x") || grid[0].include?("o")
    grid[0].each.with_index{|c,i|
      case c
      when "."
        list << "+ 1 #{i+1}"
      when "x"
        list << "o 1 #{i+1}"
      end
    }
    (1..n-2).each{|i|
      list << "+ #{n} #{i+1}"
    }
    raw = 1
    (0..n-1).each{|col|
      if grid[0][col] != "x" && grid[0][col] != "o"
        list << "x #{raw+1} #{col+1}"
        raw += 1
      end
    }
  else
    list << "o 1 1"
    (1..n-1).each{|i|
      if grid[0][i] != "+"
        list << "+ 1 #{i+1}"
      end
    }
    (1..n-2).each{|i|
      list << "+ #{n} #{i+1}"
    }
    (1..n-1).each{|i|
      list << "x #{i+1} #{i+1}"
    }
  end

  puts "Case ##{pnum+1}: #{point} #{list.size}"
  puts list.sort
}
