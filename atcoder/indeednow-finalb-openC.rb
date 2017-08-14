n=gets.to_i
s=gets.chomp
c=gets.split.map(&:to_i)
l=(0...n).map{[1]}
n.times{|i|
  d=1
  while i-d>=0 && i+d<n && s[i-d]==s[i+d]
    l[i-d]<<d*2+1
    d+=1
  end
  d=1
  while i-d+1>=0 && i+d<n && s[i-d+1]==s[i+d]
    l[i-d+1]<<d*2
    d+=1
  end
}
dp=[0]+[1e9]*n
n.times{|i|
  l[i].each{|j|
    dp[i+j]=dp[i]+c[j-1]  if dp[i+j]>dp[i]+c[j-1]
  }
}
p l
p dp[n]