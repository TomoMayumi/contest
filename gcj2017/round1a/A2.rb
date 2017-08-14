gets.to_i.times{|pnum|
  r,c = gets.split.map(&:to_i)
  cell = (1..r).map{gets.chomp}

  (0...r).each{|rr|
    (0...c).each_cons(2){|c1,c2|
      if cell[rr][c1] != "?" && cell[rr][c2] == "?"
        cell[rr][c2] = cell[rr][c1]
      end
    }
    (0...c).each_cons(2).reverse_each{|c1,c2|
      if cell[rr][c1] == "?" && cell[rr][c2] != "?"
        cell[rr][c1] = cell[rr][c2]
      end
    }
  }

  (0...c).each{|cc|
    (0...r).each_cons(2){|r1,r2|
      if cell[r1][cc] != "?" && cell[r2][cc] == "?"
        cell[r2][cc] = cell[r1][cc]
      end
    }
    (0...r).each_cons(2).reverse_each{|r1,r2|
      if cell[r1][cc] == "?" && cell[r2][cc] != "?"
        cell[r1][cc] = cell[r2][cc]
      end
    }
  }

  puts "Case ##{pnum+1}:"
  puts cell
}
