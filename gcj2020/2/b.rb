(1..gets.to_i).each{|no|
  c,d=gets.split.map(&:to_i)
  x=gets.split.map(&:to_i)
  w=(1..d).map{gets.split.map(&:to_i)}

  nei=(0..c).map{{}}
  w.each.with_index(1){|(u,v),i|
    nei[u][v]=i
    nei[v][u]=i
  }
  order=x.map.with_index(2){|o,i|[-o,i]}.sort
  timeorder=order.take_while{|o,i|o<0}.reverse
  order=order.drop_while{|o,i|o<0}
  done=1
  now=0
  time=[0,now]
  ans=[]
  order.each{|o,i|
    case
    when o==done
      now+=1
    when o>done
      (o-done).times{
        t,ti=timeorder.shift
        t=-t
        now=t
        parent,way=nei[ti].find{|k,v|time[k]}
        time[ti]=now
        ans[way]=now-time[parent]
        done+=1
      }
      now+=1
    end
    parent,way=nei[i].find{|k,v|time[k]}
    time[i]=now
    ans[way]=now-time[parent]
    done+=1
  }
  puts "Case ##{no}: #{(1..d).map{|i|ans[i]||999999}*" "}"
}
