def g;gets.split.map(&:to_i)end
c=((0..4).map{g}*"").to_i(2)
mask=[0b1100010000000000000000000,
      0b1110001000000000000000000,
      0b0111000100000000000000000,
      0b0011100010000000000000000,
      0b0001100001000000000000000,
      0b1000011000100000000000000,
      0b0100011100010000000000000,
      0b0010001110001000000000000,
      0b0001000111000100000000000,
      0b0000100011000010000000000,
      0b0000010000110001000000000,
      0b0000001000111000100000000,
      0b0000000100011100010000000,
      0b0000000010001110001000000,
      0b0000000001000110000100000,
      0b0000000000100001100010000,
      0b0000000000010001110001000,
      0b0000000000001000111000100,
      0b0000000000000100011100010,
      0b0000000000000010001100001,
      0b0000000000000001000011000,
      0b0000000000000000100011100,
      0b0000000000000000010001110,
      0b0000000000000000001000111,
      0b0000000000000000000100011
     ]
min=26
(0..2**25-1).each{|i|
  t=c
  bitcnt=0
  25.times{|j|
    if i[j]==1
      t^=mask[j]
      bitcnt+=1
      break if bitcnt>=min
    end
  }
  min=bitcnt if t==0 && min>bitcnt
}
p min==26?-1:min 