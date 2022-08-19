gets.to_i.times{
    n,m=gets.split.map(&:to_i)
    xy=(1..n).map{gets.split.map(&:to_i)}
    candidate = [0]
    base = 0
    value = 0
    xy.each{|x,y|
        delta = y*x*(y+1)/2
        square = base * y
        prebase = base
        base += x*y
        if prebase > 0 && base < 0
            n=prebase/-x
            a=prebase+x
            l=prebase+x*n
            s=n*(a+l)/2
            candidate << value+s
        end
        candidate << value + base + x
        value += delta + square
        candidate << value
        #p [delta,square,prebase,base,   candidate]
    }
    #p candidate
    p candidate.max
}