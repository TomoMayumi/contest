n = gets.to_i
a = (1..n).map{gets.to_i}
dp = (1..n).map{[]}

n.times{|i|
  dp[i][i]       = a[i]
  dp[i][(i+1)%n] = [a[i],a[(i+1)%n]].max
}

(n%2==0?3:2).step(n-1,2){|i|
  n.times{|l|
    r = (l+i)%n
    dp[l][r] = [[l,(l+1)%n,r],[r,l,(r+n-1)%n]].map{|x,nextl,nextr|
      if a[nextl] > a[nextr]
        nextl = (nextl+1)%n
      else
        nextr = (nextr+n-1)%n
      end
      a[x] + dp[nextl][nextr]
    }.max
  }
}

p n.times.map{|i|dp[(i+1)%n][i]}.max
