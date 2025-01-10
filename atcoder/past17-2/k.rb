n=gets.to_i
s=gets.chomp
anspat = -1
# -1 無理
# 0 0ならいける
# 1 0,5ならいける
# 2 偶数ならいける
# 3 なんでもいける

dic={
    1=>['0','9','8','7','6','5','4','3','2','1'],
    2=>['0',' ','4',' ','3',' ','2',' ','1',' '],
    3=>['0','3','6','9','2','5','8','1','4','7'],
    4=>['0',' ','2',' ','4',' ','6',' ','8',' '],
    6=>['0',' ','3',' ','6',' ','9',' ','2',' '],
    7=>['0','7','4','1','8','5','2','9','6','3'],
    8=>['0',' ','1',' ','2',' ','3',' ','4',' '],
    9=>['0','1','2','3','4','5','6','7','8','9'],
}

sum=0
s.chars.each.with_index(1){|c,idx|
    if c=='?'
        if idx%10 == 0
            anspat = [anspat,0].max
        elsif idx%10 == 5
            if anspat == 2
                anspat = 3
            else
                anspat = [anspat,1].max
            end
        elsif idx%2 == 0
            if anspat == 1
                anspat = 3
            else
                anspat = [anspat,2].max
            end
        else
            anspat = [anspat,3].max
        end
    else
        sum = (sum+(idx*c.to_i))%10
    end
}

if (anspat==-1 && sum!=0) || (anspat==0 && sum!=0) || (anspat==1 && sum!=0 && sum!=5) || (anspat==2 && sum%2==1)
    puts 'No'
    exit 0
end

ans=""

s.chars.each.with_index(1){|c,idx|
    if c=='?'
        if idx%10 == 0
            ans += '0'
        elsif idx%10 == 5
            if anspat==1 && sum!=0
                ans += '1'
                sum = 0
            elsif anspat==3 && sum%2==1
                ans += '1'
                sum = (sum+5)%10
            else
                ans += '0'
            end
        elsif idx%2 == 0
            if anspat==2 && sum!=0
                ans += dic[idx%10][sum]
                sum = 0
            elsif anspat==3
                if sum%2==1
                    ans += dic[idx%10][(sum+5)%10]
                    sum = 5
                else
                    ans += dic[idx%10][sum]
                    sum = 0
                end
            else
                ans += '0'
            end
        else
            ans += dic[idx%10][sum]
            sum = 0
        end
    else
        ans += c
    end
}
if sum!=0
    raise 1
end

puts "Yes"
puts ans