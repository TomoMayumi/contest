while (n,m=gets.split.map(&:to_i))!=[0,0]
  r=gets.to_i

  time=(1..r).map{gets.split.map(&:to_i)}.sort

  gets.to_i.times{
    ts,te,tm=gets.split.map(&:to_i)
    tmptime = (time.dup + [[ts,nil,tm,2],[te,nil,tm,3]]).sort_by{|a,|a}
    use = 0 # 利用PC数
    sum = 0
    pre_t = 0
    measure = false
    tmptime.each{|t,n,m,s|
      if m == tm
        case s
        when 0 # ログアウト
          use -= 1
          if measure && use==0
            sum += t - pre_t
          end
        when 1 # ログイン
          if use == 0
            pre_t = t
          end
          use += 1
        when 2 # 計測開始
          pre_t = t
          measure = true
        when 3 # 計測終了
          if use > 0
            sum += t - pre_t
          end
          measure = false
        end
      end
    }
    p sum
  }
end