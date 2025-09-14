n,q=gets.split.map(&:to_i)
a=[0]+gets.split.map(&:to_i)

s1=[0]*(n+1)
s2=[0]*(n+1)
s3=[0]*(n+1)

(1..n).each{|i|
  s1[i]=s1[i-1]+a[i]
  s2[i]=s2[i-1]+a[i]*i
  s3[i]=s3[i-1]+a[i]*i*i
}

q.times{
  l,r=gets.split.map(&:to_i)

  sum1=s1[r]-s1[l-1]
  sum2=s2[r]-s2[l-1]
  sum3=s3[r]-s3[l-1]

  p -sum3 + (l+r)*sum2 + (-l*r-l+r+1)*sum1
}
