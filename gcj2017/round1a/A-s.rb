require 'pp'
require 'prime'

def find_firstq(cell)
  c = 0
  r = cell.index{|row|c = row.index{|ce|ce!="*"}}
  [r,c]
end

def fill(cell,r,rr,c,cc,chr)
  cell[r..rr] = cell[r..rr].map{|row|
    row[c..cc] = [chr]*(cc-c+1)
    row
  }
end

def dfs(base,cell)
  pp cell
  if cell.all?{|row|row.all?{|c|c=="*"}}
    return true
  end
  r,c = find_firstq(cell)
  rr = r
  rr += 1 while ((cell[r..rr].flat_map{|row|row[c]}.uniq-["?"]).size <= 1)&&(cell[rr][c]!="*")
  if cell[rr][c] == "*"
    rr-=1
  end
  ret = false
  while rr >= r
    cc = c
    while cell[r][cc] != "*"
      target = cell[r..rr].flat_map{|row|row[c..cc]}.uniq-["?"]
      case target.size
      when 0
      when 1
        newcell = cell.map{|row|row.dup}
        fill(newcell,r,rr,c,cc,"*")
        if dfs(base,newcell)
          fill(base,r,rr,c,cc,target[0])
          return true
        end
      else
        ret = true
      end
        p [target,r,rr,c,cc]
      break if ret
      cc += 1
    end
    rr -= 1
  end
  return false
end

gets.to_i.times{|pnum|
  r,c = gets.split.map(&:to_i)
  cell = (1..r).map{gets.chomp.chars.to_a+["*"]}+([["*"]*c])

  dfs(cell,cell)

  puts "Case ##{pnum+1}:"
  puts cell[0..-2].map{|row|row[0..-2].join}
}
