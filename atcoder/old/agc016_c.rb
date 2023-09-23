H,W,h,w=gets.split.map(&:to_i)
m=(1..H).map{(1..W).map{0}}

if(H%h==0 && W%w==0)
  puts "No"
else
  0.step(H-1,h){|th|
    0.step(W-1,w){|tw|
      m[th][tw]=10000
      uh=th+h-1
      uw=tw+w-1
      if uh<H && uw<W
        m[uh][uw]=-10001
      end
    }
  }
  puts "Yes"
  puts m.map{|a|a.join(" ")}.join("\n")
end


__END__

if H<h*2 && H!=h
  if W==w
    m[0][0]=m[-1][0]=10000
    m[h-1][0]=-10001
  else
    m[0][0]=m[0][-1]=m[-1][0]=m[-1][-1]=10000
    m[h-1][w-1]=m[h-1][-w]=-10001
    (2*w-1).step(W-w-1,w){|i|m[h-1][i]=-1}
  end
  puts "Yes"
  puts m.map{|a|a.join(" ")}.join("\n")
elsif W<w*2 && W!=w
  if H==h
    m[0][0]=m[0][-1]=10000
    m[0][w-1]=-10001
  else
    m[0][0]=m[0][-1]=m[-1][0]=m[-1][-1]=10000
    m[h-1][w-1]=m[-h][w-1]=-10001
    (2*h-1).step(H-h-1,h){|i|m[i][w-1]=-1}
  end
  puts "Yes"
  puts m.map{|a|a.join(" ")}.join("\n")
else
  puts "No"
end