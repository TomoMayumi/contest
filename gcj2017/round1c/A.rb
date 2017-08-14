gets.to_i.times{|t|
  n,k = gets.split.map(&:to_i)
  pan = (1..n).map{gets.split.map(&:to_i)}.map{|rr,hh|[2*hh*rr,rr**2]}.sort

  stk = []
  k.times{ stk << pan.pop }

#  p [stk,pan]
  if pan[0]
    add_band,add_cir = pan.max_by{|aa,bb|[bb,aa]}
    min_band,_ = stk[-1]
    _,max_cir = stk.max_by{|aa,bb|bb}

#    p [add_band,add_cir,min_band,max_cir]
#    p [(add_band + add_cir - max_cir),min_band]
    if (add_band + add_cir - max_cir) > min_band
      stk[-1] = [add_band,add_cir]
    end
  end
#  p [stk,pan]

  bands,cirs = stk.transpose
  result = cirs.max + bands.inject(:+)
  result *= Math::PI

  puts "Case ##{t+1}: #{result}"
}
