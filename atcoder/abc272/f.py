# インデックス i が LMS かどうか
def getlms(t, i):
    return i > 0 and t[i - 1] == "L" and t[i] == "S"
  
def induced_sort(s, k, t, lmss):
    # 作業領域
    sa = [None] * len(s)
  
    # s に出現する文字種ごとのカウント
    bin = [0] * (k + 1)
    for ch in s: bin[ch + 1] += 1
  
    # 文字種を累積することで bin のインデックスを決める
    sum = 0
    for i in range(len(bin)):
        sum += bin[i]
        bin[i] = sum
    
    # ステップ 1: LMS のインデックスをビンの終わりの方から入れる
  
    count = [0] * k # ビンごとにすでに挿入した数をカウントする

    for i in reversed(lmss):
        ch = s[i]
        # ch を入れるビンの終わり (bin[ch + 1] - 1) から詰めていれる
        count[ch]+=1
        sa[bin[ch + 1] - count[ch]] = i

    # ステップ 2: sa を昇順に走査していく
  
    count = [-1] * k # ビンごとにすでに挿入した数をカウントする

    for i in sa:
        if i and i>0 and t[i-1]=="L":
            # sa に入っているインデックス i について、i - 1 が L 型であるとき、
            # 文字 s[i - 1] に対応するビンに i - 1 を頭から詰めていれる
            ch = s[i-1]
            count[ch]+=1
            sa[bin[ch] + count[ch]] = i-1
  
    # ステップ 3: sa を逆順に走査していく
  
    count = [0] * k # ビンごとにすでに挿入した数をカウントする

    for i in reversed(sa):
        if i and i>0 and t[i-1]=="S":
            # sa に入っているインデックス i について、i - 1 が S 型であるとき、
            # 文字 s[i - 1] に対応するビンに i - 1 を終わりから詰めていれる
            ch = s[i-1]
            count[ch]+=1
            sa[bin[ch + 1] - count[ch]] = i-1 # 上書きすることもある
  
    return sa
  
def sa_is(s, k):
    n = len(s)
    # L 型か S 型かのテーブル
    t = [None]*n
  
    # 最後は S
    lastt = t[n-1] = "S"
    lasts = s[n-1]
    for i in range(n-2,-1,-1):
        # s[i] < s[i+1] なら明らかに s[i..] < s[i+1..] => i は S 型
        # s[i] > s[i+1] なら明らかに s[i..] > s[i+1..] => i は L 型
        # s[i] == s[i+1] の場合、s[i..] <=> s[i+1..] の比較結果は
        # s[i+1..] <=> s[i+2..] に準ずる (つまり t[i + 1] と同じ)
        lasts,pres = s[i],lasts
        if lasts < pres:
            lastt = t[i] = "S"
        elif lasts > pres:
            lastt = t[i] = "L"
        else:
            t[i] = lastt
  
    lms = [getlms(t,i) for i in range(n+1)]

    # LMS のインデックスだけを集めた配列
    lmss = list(filter(lambda i: lms[i],range(n)))
  
    # 適当な「種」：seed = lmss.shuffle でもよい
    seed = lmss
  
    # 1 回目の induced sort
    sa = induced_sort(s, k, t, seed)
  
    # induced sort の結果から LMS の suffix だけ取り出す
    sa = list(filter(lambda i: lms[i],sa))
  
    # LMS のインデックス i に対して番号 nums[i] を振る
    nums = [None]*n
  
    # sa[0] の LMS は $ と決まっているので、番号 0 を振っておく
    nums[sa[0]] = num = 0
  
    # 隣り合う LMS を比べる
    for (i,j) in [sa[i:i+2] for i in range(len(sa)-1)]:
        diff, d = False, 0
    
        # 隣り合う LMS 部分文字列の比較
        for d in range(n):
            if s[i+d] != s[j+d] or (lms[i+d]) != (lms[j+d]):
                # LMS 部分文字列の範囲で異なる文字があった
                diff = True
                break
            elif d > 0 and (lms[i+d] or lms[j+d]):
                # LMS 部分文字列の終端に至った
                break
    
        # 隣り合う LMS 部分文字列が異なる場合は、番号を増やす
        if diff: num += 1
        
        # LMS のインデックス j に番号 num を振る
        nums[j] = num
  
    # nums の中に出現する番号のみを並べると、LMS 部分文字列を番号に置き換えた列が得られる
    nums = list(filter(lambda i: i != None, nums))
  
    if num + 1 < len(nums):
        # 番号の重複があるので再帰
        sa = sa_is(nums, num + 1)
    else:
        # 番号の重複がない場合、suffix array を容易に求められる
        sa = [None]*len(nums)
        for i,ch in enumerate(nums):
            sa[ch] = i
  
    # 正しい「種」
    seed = [lmss[i] for i in sa]
  
    # 2 回目の induced sort
    sa = induced_sort(s, k, t, seed)

    return sa

n=int(input())
d=ord('a')-1
s=[ord(ch)-d for ch in input()]
t=[ord(ch)-d for ch in input()]

x=t+t[0:-1]+[27]+s+s[0:-1]+[0]

k = 28 # 文字種の数
sa= sa_is(x, k)

sl=n
tl=n
ans=0
for u in sa:
    if u<n:
        tl-=1
    elif n*2<u and u<=n*3:
        sl-=1
        ans+=tl

print(ans)
