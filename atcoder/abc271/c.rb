n=gets.to_i
a=gets.split.map(&:to_i).uniq.sort
a+=[0]*(n-a.size)
cnt=0

while a[0]
    if a[0] == cnt + 1
        a.shift
    else
        break unless a.pop(2)
    end
    cnt += 1
end
p cnt
