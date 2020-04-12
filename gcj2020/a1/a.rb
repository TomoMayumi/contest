(1..gets.to_i).each{|no|
  n=gets.to_i
  pats=(1..n).map{(gets.chomp+"*a").split(?*)[0..-2]}
  *starts,longest_start=pats.map{|l|l[0]}.sort_by(&:size)
  *lasts,longest_last=pats.map{|l|l[-1]}.sort_by(&:size)
  if starts.all?{|s|longest_start.start_with? s} && lasts.all?{|s|longest_last.end_with? s}
    ans=longest_start+pats.map{|l|l[1..-2]*""}*""+longest_last
  else
    ans="*"
  end

  puts "Case ##{no}: #{ans}"
}
