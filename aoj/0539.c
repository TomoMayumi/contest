#include <stdio.h>
#include <stdlib.h>

/* iの絶対値を返す */
int abs(int i);

/* a,bの小さい方を返す */
int min(int a, int b);

/* qsort用比較関数(int型値降順) */
int cmp_int(const void *a, const void *b);



/* 店の位置（近い順に並んでいる前提）*/
static int pos[100001];

/* 店番号の範囲l〜rの中のdstに一番近い店番号を返す */
static int search_nearest(int l, int r, int dst);

int main(){
    int n,m,d,k;
    int sum,nearest,i;

    while( (scanf("%d",&d)>0) && (d>0) ){

        /* 入力 n m */
        scanf("%d",&n);
        scanf("%d",&m);

        /* 店の位置 (本店は位置0と位置dの2店舗扱いにする)*/
        pos[0] = 0;
        for(i=1;i<n;i++){
            scanf("%d",&pos[i]);
        }
        pos[n] = d;

        /*  */
        qsort(&pos[1], n-1, sizeof(int), cmp_int);

        /* 宅配毎の距離計算 */
        sum = 0;
        for(i=0;i<m;i++){
            scanf("%d",&k);
            nearest = search_nearest(0,n,k);
            sum += abs(pos[nearest] - k);
        }
        printf("%d\n",sum);
    }

    return 0;
}


static int search_nearest(int l, int r, int dst){
    int c,next_l,next_r;

    /* 再帰の終了条件：残り店舗候補が2つ */
    if(l+1==r){
        
        if(abs(pos[l]-dst)<abs(pos[r]-dst)){
            return l;
        }else{
            return r;
        }
    }else{
        /* 二分探索 */
        next_l = l;
        next_r = r;
        c = (l+r)/2;

        if(pos[c]<dst){
            next_l = c;
        }else{
            next_r = c;
        }

        return search_nearest(next_l,next_r,dst);
    }
}

int abs(int i){
    return (i<0)?i:-i;
}

int min(int a,int b){
    return (a<b)?a:b;
}


int cmp_int(const void *a, const void *b)
{
    return *(int*)a - *(int*)b;
}
