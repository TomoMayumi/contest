n=int(input())
s=input().rstrip()
anspat = -1
# -1 無理
# 0 0ならいける
# 1 0,5ならいける
# 2 偶数ならいける
# 3 なんでもいける

dic={
    '1':['0','9','8','7','6','5','4','3','2','1'],
    '2':['0',' ','4',' ','3',' ','2',' ','1',' '],
    '3':['0','3','6','9','2','5','8','1','4','7'],
    '4':['0',' ','2',' ','4',' ','6',' ','8',' '],
    '6':['0',' ','3',' ','6',' ','9',' ','2',' '],
    '7':['0','7','4','1','8','5','2','9','6','3'],
    '8':['0',' ','1',' ','2',' ','3',' ','4',' '],
    '9':['0','1','2','3','4','5','6','7','8','9'],
}

sum=0
for idx,c in enumerate(s,1):
    if c=='?':
        if idx%10 == 0:
            anspat = max(anspat,0)
        elif idx%10 == 5:
            anspat = max(anspat,1)
        elif idx%2 == 0:
            anspat = max(anspat,2)
        else:
            anspat = max(anspat,3)
    else:
        sum = (sum+(idx*int(c)))%10

if (anspat==-1 and sum!=0)or(anspat==0 and sum!=0)or(anspat==1 and sum!=0 and sum!=5)or(anspat==2 and sum%2==1):
    print('No')
    exit(0)

ans=''
for idx,c in enumerate(s,1):
    if c=='?':
        if idx%10 == 0:
            ans += '0'
        elif idx%10 == 5:
            if anspat==1 and sum!=5:
                ans += '1'
                sum = 0
            else:
                ans += '0'
        elif idx%2 == 0:
            if anspat==2 and sum!=0:
                ans += dic[c][sum]
            else:
                ans += '0'
        else:
            ans += dic[c][sum]
    else:
        ans += c

print('Yes')
print(ans)