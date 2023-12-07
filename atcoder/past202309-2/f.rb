mod=998244353
p gets.split("*").map(&:to_i).inject(1){|s,r|(s*r)%mod}