(1..gets.to_i).each{|i|
  nest=0
  ans=""
  gets.chomp.chars.map(&:to_i).each{|i|
    ans += if i>nest
      ?(*(i-nest)
    else
      ?)*(nest-i)
    end + i.to_s
    nest = i
  }
  ans += ?)*nest
  puts "Case ##{i}: #{ans}"
}
