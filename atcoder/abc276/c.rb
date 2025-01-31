n=gets.to_i
a=gets.split.map(&:to_i)

post = []
min = n
while true
    ai = a.pop
    post << ai
    if ai > min
        post = post.sort.reverse
        m = post.find{|i|i<ai}
        post.delete(m)
        puts (a + [m] + post)*" "
        exit 0
    end
    min = [min,ai].min
end
