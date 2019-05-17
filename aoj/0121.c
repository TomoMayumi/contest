#include <stdio.h>

#define QUE_MAX (8*7*6*5*4*3*2/3)

#define NULL 0
#define OK 0
#define NG -1

char cost_tbl[8][8][8][8][8][8][8];

char que[QUE_MAX][8];
int que_wp;
int que_rp;
int que_cnt;

void que_init(){
    que_wp = que_rp = que_cnt = 0;
}

char *deque(){
    char *ret;

    if(que_cnt == 0) return NULL;
    que_cnt--;

    ret = &(que[que_rp][0]);
    que_rp = (que_rp+1)%QUE_MAX;
    return ret;
}

int enque(char data[8]){
    int i;

    if(que_cnt == QUE_MAX) return NG;
    que_cnt++;

    for(i=0;i<8;i++) que[que_wp][i] = data[i];
    que_wp = (que_wp+1)%QUE_MAX;
    return OK;
}

void make_cost_tbl(){
    char data[8] = {0,1,2,3,4,5,6,7};
    
    que_init();
    (void)enque(data);
    cost_tbl[0][1][2][3][4][5][6] = 0;
    while(que_cnt>0){
        
    
}


int main(){
    int scanf_ret;
    int input[8];
    int i;
    
    return 0;
}
