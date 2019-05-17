$memo = {}
$n = gets.to_i
$a = (1..$n).map{gets.to_i}

def inc(x);(x+1)%$n;end
def dec(x);(x+$n-1)%$n;end

def dfs(l,r)
  $memo[[l,r]] ||= if l==r
    $a[l]
  elsif inc(l)==r
    [$a[l],$a[r]].max
  else
    [[$a[l],inc(l),r],[$a[r],l,dec(r)]].map{|x,nextl,nextr|
      if $a[nextl] > $a[nextr]
        nextl = inc(nextl)
      else
        nextr = dec(nextr)
      end
      x + dfs(nextl,nextr)
    }.max
  end
end

p $n.times.map{|i|dfs(inc(i),i)}.max
