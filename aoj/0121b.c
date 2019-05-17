#include <stdio.h>

#define QUE_SIZE (7*6*5*4*3*2)
#define DIGIT 8

#define dprintf(...)

// �ʒu���Ƃ̓���ւ�����ʒu���X�g
// -1�͎g�p���Ȃ�
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


///////////////////////////�R�X�g�e�[�u��
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

// �w�肳�ꂽ�f�[�^�̃R�X�g��Ԃ�
int get_cost(char *data){
    return cost[data[0]][data[1]][data[2]][data[3]][data[4]][data[5]][data[6]];
}
// �w�肳�ꂽ�f�[�^�ɃR�X�g��ݒ�
void set_cost(char *data,char c){
    cost[data[0]][data[1]][data[2]][data[3]][data[4]][data[5]][data[6]] = c;
}


///////////////////////////�L���[
char que[QUE_SIZE][DIGIT];
int que_wp;//���񏑂����݈ʒu
int que_rp;//����ǂݏo���ʒu
int que_cnt;//�i�[��

void que_init();
char *que_deque(char *buf);
void que_enque(char *data);

//������
void que_init(){
    que_wp=que_rp=que_cnt=0;
}

// �f�[�^���o��
// �f�[�^������Έ����ɏ������݂��̃A�h���X��Ԃ�
// �f�[�^���Ȃ����NULL��Ԃ�
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

// �f�[�^�i�[
void que_enque(char *data){
    int i;
    if(que_cnt>=QUE_SIZE)return;
    que_cnt++;
    for(i=0;i<DIGIT;i++){
        que[que_wp][i]=data[i];
    }
    que_wp=(que_wp+1)%QUE_SIZE;
}

////////////////////////���̑�
// 0�̈ʒu��Ԃ�
int get_zi(char *data){
    int i;
    for(i=0;i<DIGIT;i++){
        if(data[i]==0)break;
    }
    return i;
}


int main(){
    int i;
    char buf[8] = {0,1,2,3,4,5,6,7}; // �Ֆʏ��i�����l�̓S�[����ԁj
    int zi; //zero_index 0�̈ʒu
    int mi; //move_index 0�̈ړ���̈ʒu
    char c; //�R�X�g

    // �R�X�g�A�L���[�̏�����
    cost_init();
    que_init();

    // �S�[���̃R�X�g(0)�ݒ�
    que_enque(buf);
    set_cost(buf,0);

    // ���ׂĂ̔Ֆʂ̃R�X�g�����߂�
    // �L���[�ɂ̓R�X�g�̏��Ȃ����ɔՖʏ�񂪓����Ă���
    while(que_deque(buf)!=NULL){
        c = get_cost(buf);
        zi = get_zi(buf);
        for(i=0;i<3;i++){
            mi = neib[zi][i];
            if(mi<0)break;
            // 1��i�߂Ă݂�
            buf[zi]=buf[mi];
            buf[mi]=0;
            if(get_cost(buf)<0){
                // �܂����ʔՖʂɂȂ����Ȃ�R�X�g��ݒ肵�A�L���[�ɓ����
                que_enque(buf);
                set_cost(buf,c+1);
            }
            // ���̎�������̂Ői�߂�������ɖ߂�
            buf[mi]=buf[zi];
            buf[zi]=0;
        }
    }

    // ���͂ɑ΂���R�X�g��\��
    while(scanf("%d",&(buf[0]))>0){
        for(i=1;i<DIGIT;i++){
            scanf("%d",&(buf[i]));
        }
        printf("%d\n",get_cost(buf));
    }

    return 0;
}
