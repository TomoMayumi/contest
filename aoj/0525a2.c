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

// 現状態での出荷できる煎餅の数を返す
int calc_sum(int input_row, int input_col, int ary[R_MAX][C_MAX]);

int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    int sellable_max;         // 戻り値：出荷できる最大値
    int sellable_cnt;         // 出荷できる数
    int row_reverse[R_MAX+1]; // 各行の反転要否(0：反転しない、1：反転する)
    int col_reverse[C_MAX+1]; // 各列の反転要否(0：反転しない、1：反転する)
    int ri,ci;                // 行列走査用一時変数

    // 行の反転パターン初期化
    for( ri = 0; ri < (input_row+1); ri++){
        row_reverse[ri] = 0;
    }

    sellable_max = 0;

    // 行ごとに反転させるかどうかを全パターン試す
    while( row_reverse[input_row] == 0 ){

        // パターンに合わせて行を反転させる
        for( ri = 0; ri < input_row; ri++ ){
            if( row_reverse[ri] == 1 ){
                for( ci = 0; ci < input_col; ci++ ){
                    input_ary[ri][ci] = 1 - input_ary[ri][ci];
                }
            }
        }

        // 列の反転パターン初期化
        for( ci = 0; ci < (input_col+1); ci++){
            col_reverse[ci] = 0;
        }

        // 列ごとに反転させるかどうかを全パターン試す
        while( col_reverse[input_col] == 0 ){

            // パターンに合わせて列を反転させる
            for( ci = 0; ci < input_col; ci++ ){
                if( col_reverse[ci] == 1 ){
                    for( ri = 0; ri < input_row; ri++ ){
                        input_ary[ri][ci] = 1 - input_ary[ri][ci];
                    }
                }
            }

            // 出荷できる枚数を求める
            sellable_cnt = calc_sum(input_row, input_col, input_ary);

            // 最大値を更新する
            if( sellable_max < sellable_cnt ){
                sellable_max = sellable_cnt;
            }

            // パターンに合わせて列を反転させたものを元に戻す
            for( ci = 0; ci < input_col; ci++ ){
                if( col_reverse[ci] == 1 ){
                    for( ri = 0; ri < input_row; ri++ ){
                        input_ary[ri][ci] = 1 - input_ary[ri][ci];
                    }
                }
            }

            // 次の列反転パターンを求める
            col_reverse[0]++;
            for( ci = 0; ci < input_col; ci++){
                if( col_reverse[ci] < 2 ){
                    break;
                }else{
                    col_reverse[ci] = 0;
                    col_reverse[ci+1]++;
                }
            }
        }

        // パターンに合わせて行を反転させたものを元に戻す
        for( ri = 0; ri < input_row; ri++ ){
            if( row_reverse[ri] == 1 ){
                for( ci = 0; ci < input_col; ci++ ){
                    input_ary[ri][ci] = 1 - input_ary[ri][ci];
                }
            }
        }

        // 次の行反転パターンを求める
        row_reverse[0]++;
        for( ri = 0; ri < input_row; ri++){
            if( row_reverse[ri] < 2 ){
                break;
            }else{
                row_reverse[ri] = 0;
                row_reverse[ri+1]++;
            }
        }
    }

    return sellable_max;
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
