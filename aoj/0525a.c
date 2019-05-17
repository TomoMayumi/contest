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
/*
int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    return 0;
}
*/

/****** ここまでテンプレート *******/


#define MAX(a,b) ((a)>(b)?(a):(b))

// 深さ優先探索で全パターンを試す
// 行について再帰で探索
int dfs_row(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_r);
// 列について再帰で探索
int dfs_col(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_c);

// 現状態での出荷できる煎餅の数を返す
int calc_sum(int input_row, int input_col, int ary[R_MAX][C_MAX]);


int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    // 0行目から順番に、反転要否を全パターン試していく
    return dfs_row( input_row, input_col, input_ary, 0 );
}

// 行について再帰で探索
// next_r : 反転要否を試す行番号
int dfs_row(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_r){
    int ci,sum1,sum2;
    if( next_r < input_row){

        ////////////
        // 反転しないケース

        sum1 = dfs_row( input_row, input_col, ary, next_r+1 );

        ////////////
        // 反転するケース

        // 当該行を反転させる
        for( ci = 0; ci < input_col; ci++ ){
            ary[next_r][ci] = 1 - ary[next_r][ci];
        }
        sum2 = dfs_row( input_row, input_col, ary, next_r+1 );
        // 反転させて試し終わったので元に戻す
        for( ci = 0; ci < input_col; ci++ ){
            ary[next_r][ci] = 1 - ary[next_r][ci];
        }
        return MAX( sum1, sum2 );
    }else{
        // 全行を決め終わったら列の判定へ移行
        return dfs_col( input_row, input_col, ary, 0 );
    }
}

// 列について再帰で探索
// next_r : 反転要否を試す列番号
int dfs_col(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_c){
    int ri,sum1,sum2;
    if( next_c < input_col){

        ////////////
        // 反転しないケース

        sum1 = dfs_col( input_row, input_col, ary, next_c+1 );

        ////////////
        // 反転するケース

        // 当該列を反転させる
        for( ri = 0; ri < input_row; ri++ ){
            ary[ri][next_c] = 1 - ary[ri][next_c];
        }
        sum2 = dfs_col( input_row, input_col, ary, next_c+1 );
        // 反転させて試し終わったので元に戻す
        for( ri = 0; ri < input_row; ri++ ){
            ary[ri][next_c] = 1 - ary[ri][next_c];
        }
        return MAX( sum1, sum2 );
    }else{
        // 列も決め終えたらうまく焼けた個数計算
        return calc_sum( input_row, input_col, ary );
    }
}

// 現状態での出荷できる煎餅の数を返す
int calc_sum(int input_row, int input_col, int ary[R_MAX][C_MAX]){
    int ri,ci,sum;
    sum = 0;
    for( ri = 0; ri < input_row; ri++ ){
        for( ci = 0; ci < input_col; ci++ ){
            if( ary[ri][ci] == 0 ){
                sum++;
            }
        }
    }
    return sum;
}
