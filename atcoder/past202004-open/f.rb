n=gets.to_i
tasks=$<.map{|s|s.split.map(&:to_i)}.sort
sum=0
list=[]
(1..n).each{|i|
    while tasks[0]&&tasks[0][0]==i
        val=tasks.shift[1]
        list.insert(list.bsearch_index{|v|v>=val}||-1 ,val)
    end
    sum+=list.pop
    p sum
}