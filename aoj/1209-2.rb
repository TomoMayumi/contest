dp=(0..17).map{[0]*300}

dp[1]=[1]*300





$memo={}
def f(n,sq)
  if sq==1
    1
  elsif $memo[[n,sq]]
    $memo[[n,sq]]
  else
    $memo[[n,sq]]=(0..(n/(sq*sq))).map{|i|f(n-(sq*sq*i),sq-1)}.inject(:+)
  end
end

while (n=gets.to_i)>0
  p f(n,17)
end