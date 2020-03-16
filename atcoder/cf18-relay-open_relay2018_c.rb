n,h=gets.split.map(&:to_i)
hi=(1..n).map{gets.to_i}

def dfs(memo,left,h,hi)
  memo[left]||=(
    sum = 0
    left.take_while{|i|(sum+=hi[i])<=h}.map.with_index{|_,i|
      l=left.dup
      l.delete_at(i)
      dfs(memo,l,h,hi)
    }.inject(:+)||1
  )
end

p dfs({},[*0...n],h,hi)

