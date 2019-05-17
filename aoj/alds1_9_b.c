#include <stdio.h>

#define MAX_HEAP 500000     // 最大ヒープサイズ

#define right(i) (i*2)      // ヒープにおけるノードiの右の子のインデックス
#define left(i)  (i*2+1)    // ヒープにおけるノードiの左の子のインデックス

void maxHeapify(int h, int a[],int i);
void buildMaxHeap(int h, int a[]);

/*
ヒープは配列として持つ。
インデックスの考え方を問題文に合わせるため、インデックス0は使用しない。
よって、サイズhのヒープaはa[1]～a[h]を使用する。
*/


// サイズhのヒープaにおいて、iのノードを根とするツリーを最大ヒープにする
void maxHeapify(int h, int a[],int i){
    int l,r,largest,tmp;
    l = left(i);
    r = right(i);
    // 左の子、自分、右の子で値が最大のノードを選ぶ
    largest = i;
    if( (l <= h) && (a[l] > a[largest]) ){
        largest = l;
    }

    if( (r <= h) && (a[r] > a[largest]) ){
        largest = r;
    }

    if( largest != i ){ // i の子の方が値が大きい場合
        tmp         = a[i];
        a[i]        = a[largest];
        a[largest]  = tmp;
        maxHeapify(h, a, largest); // 再帰的に呼び出し
    }
}

// サイズhのヒープaを最大ヒープにする
void buildMaxHeap(int h, int a[]){
    int i;
    for( i = h/2; i > 0; i-- ){
        maxHeapify(h, a, i);
    }
}

int main(){
    int a[MAX_HEAP+1];
    int h;
    int i;

    // 入力
    scanf("%d",&h);
    for( i = 1; i <= h; i++ ){
        scanf("%d",&(a[i]));
    }

    // 最大ヒープ化
    buildMaxHeap(h, a);

    // 出力
    for( i = 1; i <= h; i++ ){
        printf(" %d",a[i]);
    }
    printf("\n");

    return 0;
}

