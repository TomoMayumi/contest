h={}
$<.map{|l|
  case l
  when /^insert (\w+)$/
    h[$1]=1
  when /^find (\w+)$/
    puts h[$1]?"yes":"no"
  end
}
  