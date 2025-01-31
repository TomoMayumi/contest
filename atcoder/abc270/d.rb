n,k=gets.split.map(&:to_i)
a=gets.split.map(&:to_i).reverse
tp=0
turn=1
a.each{|i|
    while n>=i
        n-=i
        tp+=i if turn==1
        turn=1-turn
    end
}
p tp
