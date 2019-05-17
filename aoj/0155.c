#include <stdio.h>
#include <string.h>
#include <math.h>

/***********/
// マクロ定義
/***********/
#define PQUE_SIZE (BILL_NUM*BILL_NUM)    // 優先度付きキューバッファサイズ

#define parent(i) (i/2)      // ヒープにおけるノードiの親のインデックス
#define right(i)  (i*2)      // ヒープにおけるノードiの右の子のインデックス
#define left(i)   (i*2+1)    // ヒープにおけるノードiの左の子のインデックス


/* 今回の問題向け */
#define BILL_NUM 100 //ビルの数

#define TRUE 1
#define FALSE 0



/***********/
// 型定義
/***********/
typedef struct{
    double distance;
    int history[BILL_NUM];
    int history_cnt;
    int gone[BILL_NUM+1];
} PqueItemType;   // 優先度付きキュー格納型

/***********/
// プロトタイプ
/***********/
// 公開関数
void pque_init(void);               // 初期化
int  pque_insert(PqueItemType *a);  // 要素追加
int  pque_extract(PqueItemType *a); // 要素取り出し
// 使用時要実装関数
int  pque_itemcmp(PqueItemType *a, PqueItemType *b); // 要素の優先度比較（PqueItemTypeに合わせて要実装）
// 内部関数
void maxHeapify(int h, PqueItemType a[],int i);
void buildMaxHeap(int h, PqueItemType a[]);

/***********/
// データ
/***********/

// ヒープは配列として持つ。
// インデックス計算の単純化のため、インデックス0は使用しない。
// よって、サイズhのヒープaはa[1]～a[h]を使用する。
PqueItemType    pque[PQUE_SIZE+1];  // バッファ（優先度付きキュー本体）
int             pque_itemcnt;       // 現在の格納数

/***********/
// 関数定義
/***********/
/* キューを初期化する。 */
void pque_init(void){
    pque_itemcnt = 0;
}
/* キューに要素aを追加する。 */
/* 戻り値：成功(0) キューサイズを超えた(-1) */
int pque_insert(PqueItemType *a){
    PqueItemType tmp;
    int idx;

    if(pque_itemcnt >= PQUE_SIZE) return -1;

    /* いったん要素はヒープ末端に追加し、適宜親要素と入れ替えてルートまでたどる */
    pque_itemcnt++;
    pque[pque_itemcnt] = *a;

    idx = pque_itemcnt;
    while( (parent(idx) > 0) && pque_itemcmp(&pque[idx], &pque[idx/2]) ){
        tmp               = pque[idx];
        pque[idx]         = pque[parent(idx)];
        pque[parent(idx)] = tmp;

        idx = parent(idx);
    }

    return 0;
}

/* キューから最優先要素を取り出しaに格納する。 */
/* 戻り値：成功(0) キューに何も格納されていない(-1) */
int pque_extract(PqueItemType *a){
    if(pque_itemcnt <= 0) return -1;

    *a = pque[1];

    if(pque_itemcnt>1){
        pque[1] = pque[pque_itemcnt];
        pque_itemcnt--;
        maxHeapify(pque_itemcnt, pque, 1);
    }else{
        pque_itemcnt--;
    }

    return 0;
}

/* 要素aと要素bの優先度を比較する。 */
/* 戻り値：要素aのほうが優先度が高い(1) それ以外(0) */
int  pque_itemcmp(PqueItemType *a, PqueItemType *b){
    /* PqueItemTypeが整数型であり、大きいほうが優先度が高い */
    return ( a->distance > b->distance ) ? 1 : 0;
}


// サイズhのヒープaにおいて、iのノードを根とするツリーを最大ヒープにする
void maxHeapify(int h, PqueItemType a[],int i){
    int l,r,largest;
    PqueItemType tmp;

    l = left(i);
    r = right(i);
    // 左の子、自分、右の子で値が最大のノードを選ぶ
    largest = i;
    if( (l <= h) && pque_itemcmp(&a[l], &a[largest]) ){
        largest = l;
    }

    if( (r <= h) && pque_itemcmp(&a[r], &a[largest]) ){
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
void buildMaxHeap(int h, PqueItemType a[]){
    int i;
    for( i = h/2; i > 0; i-- ){
        maxHeapify(h, a, i);
    }
}


/* 今回の問題向け */

int main(){
    int n,b,x,y,m,s,g; //入力
    int i,j;
    int pos[BILL_NUM+1][2];
    double dif[BILL_NUM+1][BILL_NUM+1];
    PqueItemType queitem;
    int ans_flag;

    pque_init();

    while(1){

        scanf("%d",&n);
        if(n<=0)break;

        //位置読み込み
        for(i=0;i<n;i++){
            scanf("%d %d %d",&b,&x,&y);
            pos[i][0]=x;
            pos[i][1]=y;
        }
        //距離計算
        for(i=1;i<=n;i++){
            for(j=1;j<=n;j++){
                dif[i][j] = hypot(pos[i][0]-pos[j][0],pos[i][1]-pos[j][1]);
            }
        }

        scanf("%d",&m);
        //位置読み込み
        for(i=0;i<m;i++){
            scanf("%d %d",&s,&g);

            //ダイクストラ

            //初期設定（最初のビルを距離0としてキューに入れる）
            queitem.distance = 0;
            queitem.history[0] = s;
            queitem.history_cnt = 1;
            for(i=1;i<=n;i++)queitem.gone[i]=FALSE;
            queitem.gone[s] = TRUE;
            pque_insert(&queitem);

            ans_flag = FALSE;
            //距離が最小のものから順に取り出して処理
            while(pque_extract(&queitem)==0){
                int hist_cnt = queitem.history_cnt;
                int last = queitem.history[hist_cnt-1];
                //ゴール判定
                if(last == g)break;
                for(i=1;i<=n;i++){
                    if(dif[last][i]>50)continue;
                    if(queitem.gone[i]==TRUE)continue;
                    //次に行けるビルをキューに入れる
                    queitem.gone[i] = TRUE;
                    queitem.distance += dif[last][i];
                    queitem.history[hist_cnt] = i;
                    queitem.history_cnt++;
                    pque_insert(&queitem);
                    //データを再利用するのでもとに戻す
                    queitem.gone[i] = FALSE;
                    queitem.distance -= dif[last][i];
                    queitem.history_cnt--;
                }
            }

            if(ans_flag==TRUE){
                for(i=0;i<queitem.history_cnt-1;i++){
                    printf("%d ",queitem.history[i]);
                }
                printf("%d\n",queitem.history_cnt-1);
            }else{
                printf("NA\n");
            }

        }

    }

    return 0;
}

