#include <stdio.h>
#define TRUE 1
#define FALSE 0

typedef struct Point_Coordinates {
    double x, y;
} point;
point Sub(const point l, const point r) {
    point ret = {l.x - r.x, l.y - r.y};

    return ret;
}

double Cross(const point a, const point b) {
    return a.x * b.y - a.y * b.x;
}

int CheckIntersection(const point a, const point b, const point c, const point d) {
    double s, t, deno = Cross(Sub(b ,a), Sub(d, c));
    if (deno == 0.0) {
        // 線分が平行
        return FALSE;
    }
    s = Cross(Sub(c , a), Sub(d , c)) / deno;
    t = Cross(Sub(b , a), Sub(a , c)) / deno;
    if (s < 0.0 || 1.0 < s || t < 0.0 || 1.0 < t) {
        // 線分が交差していない
        return FALSE;
    }
    //point ret = { a.x + s * (b - a).x, a.y + s * (b - a).y };
    return TRUE;
}

int main(){
    point a,b,c,d;
    scanf("%lf",&a.x);
    scanf("%lf",&a.y);
    scanf("%lf",&b.x);
    scanf("%lf",&b.y);
    scanf("%lf",&c.x);
    scanf("%lf",&c.y);
    scanf("%lf",&d.x);
    scanf("%lf",&d.y);
    if(CheckIntersection(a,b,c,d)){
        printf("Yes\n");
    }else{
        printf("No\n");
    }
    return 0;
}