gets
a=gets.split.map(&:to_i).sort

if(a[0..1]==[1,1])
  if a.all?{|i|i==1}
    puts "Yes"
  else
    puts "No"
  end
elsif(a[-2..-1]==[a.size-1]*2)
  if a.all?{|i|i==a.size-1}
    puts "Yes"
  else
    puts "No"
  end
elsif