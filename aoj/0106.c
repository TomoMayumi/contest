#include <stdio.h>

#define SOBA_MAX    51  /* そば購入量の最大(インデックスで50(最大購入量)までとるため要素数は51) */
#define PATTERN_MAX 6   /* 価格パターン数（３店＊通常とまとめ買いの２パターン＝６パターン） */

#define MAX_VAL 10000000 /* 正常に取りうる値の最大値より大きい値（DPの初期値に使用） */

/* 購入単位と単価の組み合わせ */
const int pattern[PATTERN_MAX][2] = {
    {   200  /100,  380             }
    ,{  200*5/100,  380*5*80/100    }
    ,{  300  /100,  550             }
    ,{  300*4/100,  550*4*85/100    }
    ,{  500  /100,  850             }
    ,{  500*3/100,  850*3*88/100    }
};


int main(){
    int input;
    int dp[SOBA_MAX];/* dp[g]: g*100[グラム]のそばを買う最安値 */
    int i;
    int g;
    int pat;
    int nextg;
    int nextval;
    

    for(i=0;i<SOBA_MAX;i++){
        dp[i] = MAX_VAL;
    }

    dp[0] = 0; /* 0g購入するには0円が最安値 */

    for(g=0;g<SOBA_MAX;g++){
        /* g*100[グラム] 購入の最安値から、各購入単位を追加購入した結果が、これまでの最安値よりも安ければ最安値を更新*/
        for(pat=0;pat<PATTERN_MAX;pat++){
            nextg = g + pattern[pat][0];
            nextval = dp[g] + pattern[pat][1];
            if( (nextg < SOBA_MAX) && (nextval < dp[nextg]) ){
                dp[nextg] = nextval;
            }
        }
    }

    while((scanf("%d",&input)>0) && (input>0)){
        printf("%d\n",dp[input/100]);
    }

    return 0;
}
