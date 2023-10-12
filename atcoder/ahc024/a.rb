# 入力
n,m=gets.split.map(&:to_i)
c=(1..n).map{gets.split.map(&:to_i)}

# 境界判定
bounds=(0...n).map{|y|(0...n).map{|x|
    bound={?U=>true,?D=>true,?L=>true,?R=>true,}
    if y==0 || c[y][x]
}}

# やれることがなくなるまでお試し行or列削除

# お試し削除成功なら各種リセット
# 失敗なら失敗した位置記憶して同じことは繰り返さない