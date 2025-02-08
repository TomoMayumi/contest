n = gets.to_i
dice = (1..n).map{
  k,*faces = gets.split.map(&:to_i)
 [k, faces]
}

max_probability = 0.0

dice.each.with_index{|(k1, faces1), i|
  face_count1 = faces1.tally
  (i + 1...dice.size).each{|j|
    k2, faces2 = dice[j]
    face_count2 = faces2.tally
    common_faces = face_count1.keys & face_count2.keys
    
    common_probability = common_faces.sum{|face|
      (face_count1[face].to_f / k1) * (face_count2[face].to_f / k2)
    }

    max_probability = [max_probability, common_probability].max
  }
}

p max_probability
