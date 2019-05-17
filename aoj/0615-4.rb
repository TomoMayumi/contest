n,*a = $<.map(&:to_i)

p (0...n).inject([0]*n){|dp,i|
  if i%2==n%2
    (0...n).map{|l|dp[a[l]>a[(l+i)%n]?(l+1)%n:l]}
  else
    (0...n).map{|l|[a[l]+dp[(l+1)%n],a[(l+i)%n]+dp[l]].max}
  end
}.max


