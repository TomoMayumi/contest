while true:
  r,c = map(int,input().split())
  if r==0: break
  for 
  tbl = [input().split() for i in range(r)]
  p (0..2**r).map{|i|
    bits = (0...r).map{|j|i[j]}
    tmp_tbl = tbl.zip(bits).map{|t,b|
      if b==0
        t
      else
        t.map{|k|1-k}
      end
    }
    tmp_tbl.transpose.map{|j|[j.count(0),j.count(1)].max}.inject(:+)
  }.max
end
