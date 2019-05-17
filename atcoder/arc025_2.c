#include <stdio.h>

#define MAX_COL (101) /* 最大列数 */
#define MAX_ROW (101) /* 最大行数 */

/* デバッグ用2次元配列表示 */
void print2d(int h, int w, int ary[MAX_COL][MAX_COL]);

void accum(int n, int input[MAX_COL], int output[MAX_COL]); /* 累積和 */
void accum2d(int h, int w, int input[MAX_COL][MAX_COL], int output[MAX_COL][MAX_COL]); /* 2次元累積和 */

int main(){
    int sum_ary[MAX_COL][MAX_COL];  /* 左上からの矩形領域の2次元累積和 */
    int h,w,c[MAX_COL][MAX_COL];    /* 入力 */
    int hs,ws,he,we;                /* ループ用一時変数(h,wそれぞれの開始位置/終了位置) */
    int max_cell_num;               /* 領域数の最大値 */
    int cell_num;                   /* 領域数 */
    int sum;                        /* 濃度の合計 */

    /* 入力 */
    scanf("%d %d",&h,&w);
    for(hs=1;hs<=h;hs++){
        for(ws=1;ws<=w;ws++){
            scanf("%d",&(c[hs][ws]));
            /* 黒はマイナス値で保持する */
            if((hs+ws)%2==0){
                c[hs][ws]=-c[hs][ws];
            }
        }
    }

    /* 後の計算を楽にするため、入力領域の左列と上行に0を番兵として入れておく */
    for(hs=0;hs<=h;hs++){
        c[hs][0] = 0;
    }
    for(ws=0;ws<=w;ws++){
        c[0][ws] = 0;
    }

    /* 累積和計算 */
    accum2d(h+1,w+1,c,sum_ary);

    /* 最大の領域を探索 */
    /* 矩形領域のパターン(左上が(hs,ws),右下が(he,we)となる矩形)を全探索 */
    /* 黒をマイナス、白をプラスの値としているため、領域の合計が0になれば条件を満たす */
    max_cell_num = 0;
    
    for(hs=1;hs<=h;hs++){
        for(ws=1;ws<=w;ws++){
            for(he=hs;he<=h;he++){
                for(we=ws;we<=w;we++){
                    /* 領域の濃度合計計算 */
                    sum = sum_ary[he][we] - sum_ary[hs-1][we] - sum_ary[he][ws-1] + sum_ary[hs-1][ws-1];
                    if(sum == 0){
                        /* 領域のサイズ計算 */
                        cell_num = (he-hs+1)*(we-ws+1);
                        if(max_cell_num < cell_num){
                            max_cell_num = cell_num;
                        }
                    }
                }
            }
        }
    }

    /* 出力 */
    printf("%d\n",max_cell_num);
}


/* 累積和 */
/* 長さ n の配列 input に対し、先頭からの累積和をoutputに入れる */
void accum(int n, int input[MAX_COL], int output[MAX_COL]){
    int i;
    output[0] = input[0];
    for(i=1;i<n;i++){
        output[i] = output[i-1] + input[i];
    }
}

/* 2次元累積和 */
/* 高さ h、幅 w の2次元配列 inputに対し、左上からの累積和を2次元配列outputに入れる */
void accum2d(int h, int w, int input[MAX_COL][MAX_COL], int output[MAX_COL][MAX_COL]){
    int hi,wi;
    accum(w,input[0],output[0]);
    for(hi=1;hi<h;hi++){
        accum(w,input[hi],output[hi]);
        for(wi=0;wi<w;wi++){
            output[hi][wi] += output[hi-1][wi];
        }
    }
}

/* デバッグ用2次元配列表示 */
void print2d(int h, int w, int ary[MAX_COL][MAX_COL]){
    int hi,wi;
    for(hi=0;hi<h;hi++){
        for(wi=0;wi<w;wi++){
            printf("%d ",ary[hi][wi]);
        }
        printf("\n");
    }
}

