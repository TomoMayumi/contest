#include <stdio.h>
#include <windows.h> // 時間計測用
#include <intrin.h>  // popcnt用

#define R_MAX 10    // 最大行サイズ
#define C_MAX 10000 // 最大列サイズ

int main( void );
int solve(int input_row, int input_col, unsigned short input_ary[C_MAX]);
int Bit1Count(unsigned short bits);

int main( void ){
    static unsigned short a[C_MAX];
    LARGE_INTEGER freq, before, after;
    double time;
    int r,c;
    int ri,ci;
    int ans,val;
    unsigned short mask=1;

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

        mask = 1;
		for(ci=0;ci<c;ci++){
			a[ci] = 0;
		}
        for(ri=0;ri<r;ri++){
            for(ci=0;ci<c;ci++){
                scanf("%d",&val);
                if (val == 1) {
					a[ci] |= mask;
				}
            }
            mask <<= 1;
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
//      input_ary[列] : 煎餅の裏表(0:裏,1:表)をbitで格納した列毎の配列
// 戻り値：
//      解答となる出荷できる煎餅の最大数
/*
int solve(int input_row, int input_col, int input_ary[C_MAX]){
    return 0;
}
*/

/****** ここまでテンプレート *******/


#define MAX(a,b) ((a)>(b)?(a):(b))

// 型定義
typedef unsigned char  uint8;
typedef unsigned short uint16;
typedef unsigned long  uint32;
typedef signed   char  sint8;
typedef signed   short sint16;
typedef signed   long  sint32;

// 引数：
//      input_row   : 行数
//      input_col   : 列数
//      input_ary[列] : 煎餅の裏表(0:裏,1:表)をbitで格納した列毎の配列
// 戻り値：
//      解答となる出荷できる煎餅の最大数
int solve(int input_row, int input_col, unsigned short input_ary[C_MAX]){
    uint32 u4sellable_max;      // 戻り値：出荷できる最大値
    uint32 u4sellable_cnt;      // ある列の出荷できる総数
    uint16 u2row_pattern;       // 行反転パターン番号
    uint16 u2row_pattern_num;   // 行反転パターンの数
    uint16 u2col;               // 列走査用一時変数
    uint8  u1row;               // 行走査用一時変数
    uint8  u1row_reverse[R_MAX];// 各行の反転要否(0：反転しない、1：反転する)
    uint8  u1front_cnt;         // 表の数
    uint8  u1back_cnt;          // 裏の数

    // 行ごとに反転させるかどうかを全パターン試す。
    // 2^row(==1<<row)パターンあり、
    // 2進数表現x桁目とx行を対応させ
    //  0：反転しない、1：反転する と考える。
    u4sellable_max = 0UL;
    u2row_pattern_num = (uint16)(1U << (uint8)input_row); // input_rowは最大10なのでuint16のサイズを超えない
    for( u2row_pattern = (uint16)0U; u2row_pattern < u2row_pattern_num; u2row_pattern++ ){

        // 列ごとに出荷できる数を求め、合計する
        u4sellable_cnt = 0UL;
        for( u2col = (uint16)0U; u2col < (uint16)input_col; u2col++ ){
            // 表の数を数える
            u1front_cnt = (uint8)Bit1Count(input_ary[u2col] ^ u2row_pattern);


            // 表の数の方が多ければ裏返せばよいので、表と裏の大きいほうの数が出荷できる
            u1back_cnt     = (uint8)input_row - u1front_cnt;
            u4sellable_cnt += MAX( u1front_cnt, u1back_cnt );
        }

        // 最大値を更新する
        if( u4sellable_max < u4sellable_cnt ){
            u4sellable_max = u4sellable_cnt;
        }
    }

    return (int)u4sellable_max;
}

// popcnt関数が使える場合
/*
int Bit1Count(unsigned short bits) {
	return (int)__popcnt16(bits);
}
*/

//popcnt関数が使えない場合
int Bit1Count(unsigned short bits) {
	bits = (bits & 0x5555) + ((bits >> 1) & 0x5555);
	bits = (bits & 0x3333) + ((bits >> 2) & 0x3333);
	bits = (bits & 0x0f0f) + ((bits >> 4) & 0x0f0f);
	bits = (bits & 0x00ff) + ((bits >> 8) & 0x00ff);
	return (int)bits;
}
