gets
s=[]
size=0
gets.split.map(&:to_i).each{|a|
    if s[-1] && s[-1][0] == a
        s[-1][1] += 1
        size += 1
        if s[-1][1] == a
            s.pop
            size -= a
        end
    else
        s << [a,1]
        size += 1
    end
    p size
}