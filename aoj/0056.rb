require"prime"
q=Prime.take(5133)
h={}
q.map{|x|h[x]=true}
while 0<n=gets.to_i
  p q.count{|x|
    x<=n/2&&h[n-x]
  }
end