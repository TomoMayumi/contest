def check xy
    ctoa = xy.count{|x,y|y==?A}-xy.count{|x,y|x==?A}
    return false if xy.count{|x,y|x==?C} < ctoa || ctoa < 0
    xy=xy.map{|x,y|[x==?C ?((ctoa-=1)<0 ? ?B : ?A) : x , y]}
    bcnt=0
    return xy.all?{|xyi|
        case xyi
        when [?A,?B];bcnt+=1
        when [?B,?A];bcnt-=1
        end
        bcnt>=0
    }
end

puts (1..gets.to_i).map{
    [[?C,?C],*gets.split[1,2].map(&:chars).inject(&:zip)].slice_before{|xc,yc|yc==?C}.all?{|(c,_),*xy|c==?C && check(xy)} ? "Yes" : "No"
}
