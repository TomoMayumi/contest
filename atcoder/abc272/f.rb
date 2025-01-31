# インデックス i が LMS かどうか
def lms?(t, i)
    i > 0 && t[i - 1] == :L && t[i] == :S
end
  
def induced_sort(s, k, t, lmss)
    # 作業領域
    sa = [nil] * s.size
  
    # s に出現する文字種ごとのカウント
    bin = [0] * (k + 1)
    s.each{|ch| bin[ch + 1] += 1 }
  
    # 文字種を累積することで bin のインデックスを決める
    sum = 0
    bin.map!{|v| sum += v }
    
    # ステップ 1: LMS のインデックスをビンの終わりの方から入れる
  
    count = [0] * k # ビンごとにすでに挿入した数をカウントする
  
    lmss.reverse_each{|i|
        ch = s[i]
        # ch を入れるビンの終わり (bin[ch + 1] - 1) から詰めていれる
        sa[bin[ch + 1] - (count[ch]+=1)] = i
    }
  
    # ステップ 2: sa を昇順に走査していく
  
    count = [-1] * k # ビンごとにすでに挿入した数をカウントする
  
    sa.each{|i|
        if i && i>0 && t[ii=i-1]==:L
            # sa に入っているインデックス i について、i - 1 が L 型であるとき、
            # 文字 s[i - 1] に対応するビンに i - 1 を頭から詰めていれる
            ch = s[ii]
            sa[bin[ch] + (count[ch]+=1)] = ii
        end
    }
  
    # ステップ 3: sa を逆順に走査していく
  
    count = [0] * k # ビンごとにすでに挿入した数をカウントする
  
    sa.reverse_each{|i|
        if i && i>0 && t[ii=i-1]==:S
            # sa に入っているインデックス i について、i - 1 が S 型であるとき、
            # 文字 s[i - 1] に対応するビンに i - 1 を終わりから詰めていれる
            ch = s[ii]
            sa[bin[ch + 1] - (count[ch]+=1)] = ii # 上書きすることもある
        end
    }
  
    p sa
    sa
end
  
def sa_is(s, k)
    n = s.size
    # L 型か S 型かのテーブル
    t = []
  
    # 最後は S
    lastt = t[n-1] = :S
    lasts = s[n-1]
    (n - 2).downto(0){|i|
        # s[i] < s[i+1] なら明らかに s[i..] < s[i+1..] => i は S 型
        # s[i] > s[i+1] なら明らかに s[i..] > s[i+1..] => i は L 型
        # s[i] == s[i+1] の場合、s[i..] <=> s[i+1..] の比較結果は
        # s[i+1..] <=> s[i+2..] に準ずる (つまり t[i + 1] と同じ)
        lasts,pres = s[i],lasts
        lastt = t[i] = case
        when lasts < pres then :S
        when lasts > pres then :L
        else                   lastt
        end
    }
  
    lms = (0..n).map{|i|lms?(t,i)}

    # LMS のインデックスだけを集めた配列
    lmss = (0...n).select {|i| lms[i] }
  
    # 適当な「種」：seed = lmss.shuffle でもよい
    seed = lmss
  
    # 1 回目の induced sort
    sa = induced_sort(s, k, t, seed)
  
    # induced sort の結果から LMS の suffix だけ取り出す
    sa.select! {|i| lms[i] }
  
    # LMS のインデックス i に対して番号 nums[i] を振る
    nums = []
  
    # sa[0] の LMS は $ と決まっているので、番号 0 を振っておく
    nums[sa[0]] = num = 0
  
    # 隣り合う LMS を比べる
    sa.each_cons(2){|i, j|
        diff, d = false, 0
    
        # 隣り合う LMS 部分文字列の比較
        n.times{|d|
            if s[id=i+d] != s[jd=j+d] || (lmsid=lms[id]) != (lmsjd=lms[jd])
                # LMS 部分文字列の範囲で異なる文字があった
                diff = true
                break
            elsif d > 0 && (lmsid || lmsjd)
                # LMS 部分文字列の終端に至った
                break
            end
        }
    
        # 隣り合う LMS 部分文字列が異なる場合は、番号を増やす
        num += 1 if diff
        
        # LMS のインデックス j に番号 num を振る
        nums[j] = num
    }
  
    # nums の中に出現する番号のみを並べると、LMS 部分文字列を番号に置き換えた列が得られる
    nums.compact!
  
    if num + 1 < nums.size
        # 番号の重複があるので再帰
        sa = sa_is(nums, num + 1)
    else
        # 番号の重複がない場合、suffix array を容易に求められる
        sa = []
        nums.each.with_index {|ch, i| sa[ch] = i }
        p sa
    end
  
    # 正しい「種」
    seed = sa.map {|i| lmss[i] }
  
    # 2 回目の induced sort
    sa = induced_sort(s, k, t, seed)
  
    sa
end

n=gets.to_i
d=?a.ord-1
s=gets.chomp.chars.map{|i|i.ord-d}
t=gets.chomp.chars.map{|i|i.ord-d}

x=t+t[0..-2]+[27]+s+s[0..-2]+[0]

k = 28 # 文字種の数
sa= sa_is(x, k)

sl=n
tl=n
ans=0
sa.each{|u|
    if u<n
        tl-=1
    elsif n*2<u && u<=n*3
        sl-=1
        ans+=tl
    end
}
p ans