def dfs(memo,w,h,m,o,map,tw,th,nest)
  return 1e9 if o<=1
  return 1e9 if th <= 0 || h < th
  return 1e9 if tw <= 0 || w < tw
  return [0,-map[th][tw]].max if h==th
  return memo[[th,tw,o,map[th]]] if memo[[th,tw,o,map[th]]]

  cell = map[th][tw]
  map[th][tw] = 0
  ans = if cell > 0
    [ dfs(memo,w,h,m,[o-1+cell,m].min,map,tw,th+1,nest+1),
      dfs(memo,w,h,m,[o-1+cell,m].min,map,tw-1,th,nest+1),
      dfs(memo,w,h,m,[o-1+cell,m].min,map,tw+1,th,nest+1) ].min
  else
    [ dfs(memo,w,h,m,o-1,map,tw,th+1,nest+1)-cell,
      dfs(memo,w,h,m,o-1,map,tw-1,th,nest+1)-cell,
      dfs(memo,w,h,m,o-1,map,tw+1,th,nest+1)-cell ].min
  end
  map[th][tw] = cell

  return memo[[th,tw,o,map[th]]] = ans
end

while (w,h=gets.split.map(&:to_i))!=[0,0]
  f,m,o=gets.split.map(&:to_i)
  map = [[0]*(w+2)]+(1..h).map{[0]+gets.split.map(&:to_i)+[0]}+[[0]*(w+2)]
  memo={}
  cost = (1..w).map{|tw|dfs(memo,w,h,m,o,map,tw,1,0)}.min
  puts (cost>f)?"NA":cost
end