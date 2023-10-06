n,q=gets.split.map(&:to_i)
tbl=(0..n).map{[]}

$<.each{|s|
    t,a,b=s.split.map(&:to_i)
    case t
    when 1
        tbl[a][b]=true
    when 2
        tbl.each_with_index{|l,i|
            tbl[a][i] = true if l[a]
        }
    when 3
        tbl[a].map.with_index.select{|v,i|v}.flat_map{|v,i|tbl[i].map.with_index.select{|v2,i2|v2 && (a!=i2)}}.each{|v2,i2|
            tbl[a][i2] = true
        }
    end
}

puts (1..n).map{|a|(1..n).map{|b|tbl[a][b]?"Y":"N"}*""}