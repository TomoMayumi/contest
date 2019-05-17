#include <stdio.h>

#define QUE_SIZE (7*6*5*4*3*2)
#define DIGIT 8

#define dprintf(...)

// 位置ごとの入れ替えられる位置リスト
// -1は使用しない
const int neib[DIGIT][3] = {
    {1,4,-1},
    {0,2,5},
    {1,3,6},
    {2,7,-1},
    {0,5,-1},
    {1,4,6},
    {2,5,7},
    {3,6,-1}
};


///////////////////////////コストテーブル
char cost[8][8][8][8][8][8][8]={{{{{{{0}}}}}}};

void cost_init();
int get_cost(char *data);
void set_cost(char *data,char c);

void cost_init(){
    int i;
    char *pcost;
    pcost = (char*)cost;
    for(i=0;i<8*8*8*8*8*8*8;i++){
        pcost[i]=-1;
    }
}

// 指定されたデータのコストを返す
int get_cost(char *data){
    return cost[data[0]][data[1]][data[2]][data[3]][data[4]][data[5]][data[6]];
}
// 指定されたデータにコストを設定
void set_cost(char *data,char c){
    cost[data[0]][data[1]][data[2]][data[3]][data[4]][data[5]][data[6]] = c;
}


///////////////////////////キュー
char que[QUE_SIZE][DIGIT];
int que_wp;//次回書き込み位置
int que_rp;//次回読み出し位置
int que_cnt;//格納数

void que_init();
char *que_deque(char *buf);
void que_enque(char *data);

//初期化
void que_init(){
    que_wp=que_rp=que_cnt=0;
}

// データ取り出し
// データがあれば引数に書き込みそのアドレスを返す
// データがなければNULLを返す
char *que_deque(char *buf){
    int i;
    if(que_cnt<=0)return NULL;
    que_cnt--;
    for(i=0;i<DIGIT;i++){
        buf[i]=que[que_rp][i];
    }
    que_rp=(que_rp+1)%QUE_SIZE;
    return buf;
}

// データ格納
void que_enque(char *data){
    int i;
    if(que_cnt>=QUE_SIZE)return;
    que_cnt++;
    for(i=0;i<DIGIT;i++){
        que[que_wp][i]=data[i];
    }
    que_wp=(que_wp+1)%QUE_SIZE;
}

////////////////////////その他
// 0の位置を返す
int get_zi(char *data){
    int i;
    for(i=0;i<DIGIT;i++){
        if(data[i]==0)break;
    }
    return i;
}


int main(){
    int i;
    char buf[8] = {0,1,2,3,4,5,6,7}; // 盤面情報（初期値はゴール状態）
    int zi; //zero_index 0の位置
    int mi; //move_index 0の移動先の位置
    char c; //コスト

    // コスト、キューの初期化
    cost_init();
    que_init();

    // ゴールのコスト(0)設定
    que_enque(buf);
    set_cost(buf,0);

    // すべての盤面のコストを求める
    // キューにはコストの少ない順に盤面情報が入っている
    while(que_deque(buf)!=NULL){
        c = get_cost(buf);
        zi = get_zi(buf);
        for(i=0;i<3;i++){
            mi = neib[zi][i];
            if(mi<0)break;
            // 1手進めてみる
            buf[zi]=buf[mi];
            buf[mi]=0;
            if(get_cost(buf)<0){
                // まだ見ぬ盤面になったならコストを設定し、キューに入れる
                que_enque(buf);
                set_cost(buf,c+1);
            }
            // 次の手を試すので進めた手を元に戻す
            buf[mi]=buf[zi];
            buf[zi]=0;
        }
    }

    // 入力に対するコストを表示
    while(scanf("%d",&(buf[0]))>0){
        for(i=1;i<DIGIT;i++){
            scanf("%d",&(buf[i]));
        }
        printf("%d\n",get_cost(buf));
    }

    return 0;
}
