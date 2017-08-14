h,w=gets.split
gets
puts gets.split.flat_map.with_index{|c,i|[i+1]*c.to_i}.each_slice(w.to_i).map.with_index{|c,i|(i%2<1?c:c.reverse)*" "}