gets
$<.map(&:to_i).each_cons(2){|a,b|
    if a==b
        puts "stay"
    elsif a>b
        puts "down #{a-b}"
    else
        puts "up #{b-a}"
    end
}