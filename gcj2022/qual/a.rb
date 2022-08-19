gets.to_i.times{|i|
    r,c=gets.split.map(&:to_i)
    r1 = "+"+"-+"*c
    r2 = "|"+".|"*c
    m = [r1]+[r2,r1]*r
    m[0] = m[0].dup
    m[1] = m[1].dup
    m[0][0]=m[0][1]=m[1][0]="."

    puts "Case ##{i+1}:"
    puts m
}