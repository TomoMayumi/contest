_,s,t=$<.map(&:chomp)
p (t.start_with?(s) ? 0 : 2)  + (t.end_with?(s) ? 0 : 1)
