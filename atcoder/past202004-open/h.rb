n,m=gets.split.map(&:to_i)
list=(0..10).map{[]}
(1..n).each{|i|
    s=gets
    (1..m).each{|j|
        listi = case s[j-1]
            when ?S then 0
            when ?G then 10
            else s[j-1].to_i
            end
        list[listi] << [i,j]
    }
}
if list.any?{|l|l.empty?}
    p -1
    exit
end
pos=[[*list[0][0],0]]
(1..10).each{|i|
    pos=list[i].map{|x,y|[x,y,pos.map{|xx,yy,c|c+(x-xx).abs+(y-yy).abs}.min]}
}
p pos[0][2]