#include <stdio.h>

#define LOGOUT  (0U)
#define LOGIN   (1U)

#define PRE    (0U) /* 計測開始前 */
#define RUN    (1U) /* 計測中     */
#define END    (2U) /* 計測終了後 */

#define MAX     (1000U)

int log[MAX][4];
int r;

int calc(int ts,int te,int m);

int main(){
    int N,M,q,ts,te,m;
    int i;
    while(scanf("%d %d",&N,&M)&&(N>0)){
        /* ログ格納 */
        scanf("%d",&r);
        for(i=0;i<r;i++){
            scanf("%d %d %d %d",&log[i][0],&log[i][1],&log[i][2],&log[i][3]);
        }
        /* 質問毎に回答を出力 */
        scanf("%d",&q);
        for(i=0;i<q;i++){
            scanf("%d %d %d",&ts,&te,&m);
            printf("%d\n",calc(ts,te,m));
        }
    }
    return 0;
}

int calc(int ts,int te,int m){
    int use_cnt         = 0;        /* 利用PC数 */
    int sum             = 0;        /* 利用時間合計*/
    int pre_t           = 0;        /* 前回ログ時間 */
    int measure_state   = PRE;      /* 計測状態 */
    int i,log_t,log_m,log_s;

    /* ログを順番に確認 */
    for(i=0;i<r;i++){
        log_t = log[i][0];
        log_m = log[i][2];
        log_s = log[i][3];

        /* 計測開始チェック */
        if( (measure_state == PRE) && (log_t >= ts) ){
            measure_state = RUN;
            pre_t = ts;
        }

        /* 計測終了チェック */
        if( (measure_state == RUN) && (log_t >= te) ){
            measure_state = END;
            if(use_cnt>0){
                sum += te - pre_t;
            }
        }

        if(log_m == m){
            if(log_s==LOGIN){
                /* ログイン */
                if(use_cnt==0){
                    pre_t = log_t;
                }
                use_cnt++;
            }else{
                /* ログアウト */
                use_cnt--;
                if( (measure_state == RUN) && (use_cnt==0) ){
                    sum += log_t - pre_t;
                }
            }
        }
    }
    return sum;
}