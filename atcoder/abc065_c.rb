class Integer
  def !
    (1..self).inject(1){|s,r|s*r%1000000007}
  end
end

n,m=gets.split.map(&:to_i)

if (n-m).abs>1
  p 0
else
  p n.! * m.! * ((n==m)?2:1) % 1000000007
end