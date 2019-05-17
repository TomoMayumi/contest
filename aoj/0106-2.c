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

int memo[SOBA_MAX];

int dfs(int soba){
    int pat;
    int min;
    int val;

    if(memo[soba]<MAX_VAL) return memo[soba];

    min = MAX_VAL;

    /* 各購入単位を購入してみて残り量の最安値を計算し、その合計の最小値が最安値 */
    for(pat=0;pat<PATTERN_MAX;pat++){
        if( soba-pattern[pat][0] >= 0 ){
            val = pattern[pat][1] + dfs(soba-pattern[pat][0]);
            if( min > val ){
                min = val;
            }
        }
    }

    return memo[soba]=min;
}

int main(){
    int input;
    int i;

    for(i=0;i<SOBA_MAX;i++){
        memo[i] = MAX_VAL;
    }

    memo[0] = 0; /* 0g購入するには0円が最安値 */

    while((scanf("%d",&input)>0) && (input>0)){
        printf("%d\n",dfs(input/100));
    }

    return 0;
}
