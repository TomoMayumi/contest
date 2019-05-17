#include <stdio.h>
#include <windows.h> // 時間計測用

#define R_MAX 10    // 最大行サイズ
#define C_MAX 10000 // 最大列サイズ

int main( void );
int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]);

int main( void ){
    static int a[R_MAX][C_MAX];
    LARGE_INTEGER freq, before, after;
    double time;
    int r,c;
    int ri,ci;
    int ans;

    //変数の初期化
    memset(&freq,   0x00, sizeof freq);
    memset(&before, 0x00, sizeof before);
    memset(&after,  0x00, sizeof after);

    // 時間計測用周波数取得
    QueryPerformanceFrequency(&freq);

    while(1){
        //入力
        scanf("%d %d",&r,&c);
        if( (r<=0) || (c<=0) ) break;

        for(ri=0;ri<r;ri++){
            for(ci=0;ci<c;ci++){
                scanf("%d",&(a[ri][ci]));
            }
        }
        //処理（＋時間計測）
        QueryPerformanceCounter(&before);
        ans = solve(r,c,a);
        QueryPerformanceCounter(&after);

        //出力
        printf("%d\n",ans);
        time = ((double)(after.QuadPart - before.QuadPart) * 1000 / freq.QuadPart);
        printf("処理時間：%f[ms]\n",time);
    }

    return 0;
}


// 引数：
//      input_row   : 行数
//      input_col   : 列数
//      input_ary[行][列] : 煎餅の裏表(0:裏,1:表)が格納された2重配列
// 戻り値：
//      解答となる出荷できる煎餅の最大数

int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    return 0;
}


/****** ここまでテンプレート *******/


#define MAX(a,b) ((a)>(b)?(a):(b))

typedef unsigned char  uint8;
typedef unsigned short uint16;
typedef unsigned long  uint32;
typedef signed   char  sint8;
typedef signed   short sint16;
typedef signed   long  sint32;

int solve2(int r, int c, int a[R_MAX][C_MAX]){
    int sellable_max;       // 戻り値：出荷できる最大値
    int row_pattern;        // 行反転パターン一時変数
    int row_pattern_num;    // 行反転パターンの数
    int row_reverse[R_MAX]; // 各行の反転要否(0：反転しない、1：反転する)
    int sellable_cnt;       // 出荷できる総数
    int ri,ci;              // 行列走査用一時変数
    int front_cnt;          // 表の数
    int back_cnt;           // 裏の数

    // 行ごとに反転させるかどうかを全パターン試す
    // 2^r(==1<<r)パターンあり、
    // 2進数表現r桁とr行を対応させ
    //  0：反転しない、1：反転する と考える
    sellable_max = 0;
    row_pattern_num = (int)(1 << r); // rは最大10なのでintのサイズを超えない
    for( row_pattern = 0; row_pattern < row_pattern_num; row_pattern++ ){

        // 各行の反転要否を扱いやすくするため配列に格納しておく
        for( ri = 0; ri < r; ri++ ){
            row_reverse[ri] = (row_pattern>>ri) & 0x01;
        }

        // 列ごとに出荷できる数を求め、合計する
        sellable_cnt = 0;
        for( ci = 0; ci < c; ci++ ){

            // 裏の数を数える
            back_cnt = 0;
            for( ri = 0; ri < r; ri++ ){
                // [0(裏),0(反転しない)] または [1(表),1(反転する)] のとき裏
                if( (a[ri][ci]^row_reverse[ri]) == 0x00 ){
                    back_cnt++;
                }
            }

            // 表の数の方が多ければ裏返せばよいので、大きいほうの数が出荷できる
            front_cnt     = r - back_cnt;
            sellable_cnt += MAX( front_cnt, back_cnt );
        }

        // 最大値を更新する
        if( sellable_max < sellable_cnt ){
            sellable_max = sellable_cnt;
        }
    }

    return sellable_max;
}

