n,a,b,c,d=gets.split.map(&:to_i)
aa=(1..n/2).inject([[a,a]]){|s,r|
  s.flat_map{|st,ed|[[st-d,ed-c],[st+c,ed+d]]}.sort.inject([]){|s,r|
    if s[0]
      if s[-1][1] >= r[0]
        s[-1][1] = [s[-1][1],r[1]].max
        s
      else
        s << r
      end
    else
      [r]
    end
  }
}
bb=(1..(n+1)/2).inject([[b,b]]){|s,r|
  s.flat_map{|st,ed|[[st-d,ed-c],[st+c,ed+d]]}.sort.inject([]){|s,r|
    if s[0]
      if s[-1][1] >= r[0]
        s[-1][1] = [s[-1][1],r[1]].max
        s
      else
        s << r
      end
    else
      [r]
    end
  }
}
p aa,bb