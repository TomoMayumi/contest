def max_min_cross(p1, p2, p3, p4)
    min_ab, max_ab = [p1, p2].min, [p1, p2].max
    min_cd, max_cd = [p3, p4].min, [p3, p4].max

    return min_ab <= max_cd && max_ab >= min_cd
end

def cross_judge(a, b, c, d)
    # x座標による判定
    return false unless max_min_cross(a[0], b[0], c[0], d[0])
        

    # y座標による判定
    return false unless max_min_cross(a[1], b[1], c[1], d[1])

    tc1 = (a[0] - b[0]) * (c[1] - a[1]) + (a[1] - b[1]) * (a[0] - c[0])
    tc2 = (a[0] - b[0]) * (d[1] - a[1]) + (a[1] - b[1]) * (a[0] - d[0])
    td1 = (c[0] - d[0]) * (a[1] - c[1]) + (c[1] - d[1]) * (c[0] - a[0])
    td2 = (c[0] - d[0]) * (b[1] - c[1]) + (c[1] - d[1]) * (c[0] - b[0])
    return tc1 * tc2 <= 0 && td1 * td2 <= 0
end

AB = gets.split.map(&:to_i)
CD = gets.split.map(&:to_i)
A = AB[0,2]
B = AB[2,2]
C = CD[0,2]
D = CD[2,2]

puts cross_judge(A, B, C, D) ? "Yes" : "No"
