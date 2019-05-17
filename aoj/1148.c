#include <stdio.h>

#define LOGOUT  (0U)
#define LOGIN   (1U)

#define PRE    (0U) /* �v���J�n�O */
#define RUN    (1U) /* �v����     */
#define END    (2U) /* �v���I���� */

#define MAX     (1000U)

int log[MAX][4];
int r;

int calc(int ts,int te,int m);

int main(){
    int N,M,q,ts,te,m;
    int i;
    while(scanf("%d %d",&N,&M)&&(N>0)){
        /* ���O�i�[ */
        scanf("%d",&r);
        for(i=0;i<r;i++){
            scanf("%d %d %d %d",&log[i][0],&log[i][1],&log[i][2],&log[i][3]);
        }
        /* ���█�ɉ񓚂��o�� */
        scanf("%d",&q);
        for(i=0;i<q;i++){
            scanf("%d %d %d",&ts,&te,&m);
            printf("%d\n",calc(ts,te,m));
        }
    }
    return 0;
}

int calc(int ts,int te,int m){
    int use_cnt         = 0;        /* ���pPC�� */
    int sum             = 0;        /* ���p���ԍ��v*/
    int pre_t           = 0;        /* �O�񃍃O���� */
    int measure_state   = PRE;      /* �v����� */
    int i,log_t,log_m,log_s;

    /* ���O�����ԂɊm�F */
    for(i=0;i<r;i++){
        log_t = log[i][0];
        log_m = log[i][2];
        log_s = log[i][3];

        /* �v���J�n�`�F�b�N */
        if( (measure_state == PRE) && (log_t >= ts) ){
            measure_state = RUN;
            pre_t = ts;
        }

        /* �v���I���`�F�b�N */
        if( (measure_state == RUN) && (log_t >= te) ){
            measure_state = END;
            if(use_cnt>0){
                sum += te - pre_t;
            }
        }

        if(log_m == m){
            if(log_s==LOGIN){
                /* ���O�C�� */
                if(use_cnt==0){
                    pre_t = log_t;
                }
                use_cnt++;
            }else{
                /* ���O�A�E�g */
                use_cnt--;
                if( (measure_state == RUN) && (use_cnt==0) ){
                    sum += log_t - pre_t;
                }
            }
        }
    }
    return sum;
}