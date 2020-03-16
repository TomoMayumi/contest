n=gets.to_i
p=gets.split.map(&:to_f)

#arr = (0..n).map{|i|[0]*(i+1)}
#arr[0][0]=1
p p.inject([1]){|dp,pi|
  rpi = 1-pi
  dp.each_with_object([0]*(dp.size+1)).with_index{|(ai,newdp),j|
    newdp[j] += ai * rpi
    newdp[j+1] += ai * pi
  }
}[-n/2..-1].inject(:+)
__END__
p pi.inject({[0,0]=>1.0}){|s,r|
  s.each_with_object({}){|((kf,kb),v),o|
    h = {
      [kf+1,kb  ]=>v*r,
      [kf  ,kb+1]=>v*(1-r)
    }
    o.update(h){|k,v1,v2|v1+v2}
  }
}.select{|(kf,kb),v|kf>kb}.values.inject(:+)