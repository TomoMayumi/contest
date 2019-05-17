MAX = 2 ** 31
 
def solve(h, w, o, used)
  minimum = MAX
  ro = o - 1
  return minimum if w < 0 or w > $wl
  return 0 if h == ($hl+1) and ro >= 0
  return minimum if ro <= 0
  $memo[h] ||= {}
  $memo[h][w] = {} unless $memo[h].key? w
  $memo[h][w][o] = {} unless $memo[h][w].key? o
  return $memo[h][w][o][used] if $memo[h][w][o].key? used
  if ((used >> w) & 1) == 1 then
    # ??\????????N????????????????????L???
    minimum = [solve(h+1, w,   ro, 0), minimum].min
    minimum = [solve(h,   w-1, ro, used), minimum].min
    minimum = [solve(h,   w+1, ro, used), minimum].min
  elsif ((used >> w) & 1) == 0 then
    # ??\????????N????????????????????L???
    used_new = used | (1 << w)
    if $field[h][w] < 0 then
      # ????????????????????L???
      minimum = [solve(h+1, w, ro, 0) - $field[h][w], minimum].min
      minimum = [solve(h,   w-1, ro, used_new) - $field[h][w], minimum].min
      minimum = [solve(h,   w+1, ro, used_new) - $field[h][w], minimum].min
    else
      # ????????????????L??????L???
      oxy = ((ro+$field[h][w]) > $ml) ? $ml : (ro+$field[h][w])
      minimum = [solve(h+1, w,   oxy, 0), minimum].min
      minimum = [solve(h,   w-1, oxy, used_new), minimum].min
      minimum = [solve(h,   w+1, oxy, used_new), minimum].min
    end
  end
  # p "h:#{h}, w:#{w}, o:#{o}, used:#{used}, min:#{minimum}"
  return $memo[h][w][o][used] = minimum
end
 
def gets_ints
  gets.split(" ").map(&:to_i)
end
 
loop do
  $memo = {}
  $wl, $hl = gets_ints
  break if $wl == 0 and $hl == 0
  $hl -= 1
  $wl -= 1
  $fl, $ml, $ol = gets_ints
  $field = (0..$hl).map { gets_ints }
  ans = (0..$wl).map do |w|
    solve(0, w, $ol, 0)
  end.min
  puts ans > $fl ? 'NA' : ans
end