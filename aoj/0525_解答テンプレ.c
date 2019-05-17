#include <stdio.h>

#define R_MAX 10    // 最大行サイズ
#define C_MAX 10000 // 最大列サイズ

int main( void );
int solve(int r, int c, int a[R_MAX][C_MAX]);

int main( void ){
    static int a[R_MAX][C_MAX];
    int r,c;
    int ri,ci;
    int ans;

    while(1){
        //入力
        scanf("%d %d",&r,&c);
        if( (r<=0) || (c<=0) ) break;

        for(ri=0;ri<r;ri++){
            for(ci=0;ci<c;ci++){
                scanf("%d",&(a[ri][ci]));
            }
        }
        //処理
        ans = solve(r,c,a);
        //出力
        printf("%d\n",ans);
    }

    return 0;
}


// 引数：
//      r   : 行数
//      c   : 列数
//      a[行][列] : 煎餅の裏表(0:裏,1:表)が格納された2重配列
// 戻り値：
//      解答となる出荷できる煎餅の最大数

int solve(int r, int c, int a[R_MAX][C_MAX]){
    return 0;
}


/****** ここまでテンプレート *******/
