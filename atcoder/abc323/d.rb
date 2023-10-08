n=gets.to_i
slimes = Hash.new{0}
n.times{
    s,c=gets.split.map(&:to_i)
    slimes[s]=c
}
sum=0
slimes.keys.sort.each{|k|
    left = slimes[k]
    slimes[k]=0
    while left > 0
        sum += 1 if left.odd?
        k*=2
        left = left/2 + slimes[k]
        slimes[k]=0
    end
}
p sum
