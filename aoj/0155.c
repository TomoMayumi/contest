#include <stdio.h>
#include <string.h>
#include <math.h>

/***********/
// �}�N����`
/***********/
#define PQUE_SIZE (BILL_NUM*BILL_NUM)    // �D��x�t���L���[�o�b�t�@�T�C�Y

#define parent(i) (i/2)      // �q�[�v�ɂ�����m�[�hi�̐e�̃C���f�b�N�X
#define right(i)  (i*2)      // �q�[�v�ɂ�����m�[�hi�̉E�̎q�̃C���f�b�N�X
#define left(i)   (i*2+1)    // �q�[�v�ɂ�����m�[�hi�̍��̎q�̃C���f�b�N�X


/* ����̖����� */
#define BILL_NUM 100 //�r���̐�

#define TRUE 1
#define FALSE 0



/***********/
// �^��`
/***********/
typedef struct{
    double distance;
    int history[BILL_NUM];
    int history_cnt;
    int gone[BILL_NUM+1];
} PqueItemType;   // �D��x�t���L���[�i�[�^

/***********/
// �v���g�^�C�v
/***********/
// ���J�֐�
void pque_init(void);               // ������
int  pque_insert(PqueItemType *a);  // �v�f�ǉ�
int  pque_extract(PqueItemType *a); // �v�f���o��
// �g�p���v�����֐�
int  pque_itemcmp(PqueItemType *a, PqueItemType *b); // �v�f�̗D��x��r�iPqueItemType�ɍ��킹�ėv�����j
// �����֐�
void maxHeapify(int h, PqueItemType a[],int i);
void buildMaxHeap(int h, PqueItemType a[]);

/***********/
// �f�[�^
/***********/

// �q�[�v�͔z��Ƃ��Ď��B
// �C���f�b�N�X�v�Z�̒P�����̂��߁A�C���f�b�N�X0�͎g�p���Ȃ��B
// ����āA�T�C�Yh�̃q�[�va��a[1]�`a[h]���g�p����B
PqueItemType    pque[PQUE_SIZE+1];  // �o�b�t�@�i�D��x�t���L���[�{�́j
int             pque_itemcnt;       // ���݂̊i�[��

/***********/
// �֐���`
/***********/
/* �L���[������������B */
void pque_init(void){
    pque_itemcnt = 0;
}
/* �L���[�ɗv�fa��ǉ�����B */
/* �߂�l�F����(0) �L���[�T�C�Y�𒴂���(-1) */
int pque_insert(PqueItemType *a){
    PqueItemType tmp;
    int idx;

    if(pque_itemcnt >= PQUE_SIZE) return -1;

    /* ��������v�f�̓q�[�v���[�ɒǉ����A�K�X�e�v�f�Ɠ���ւ��ă��[�g�܂ł��ǂ� */
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

/* �L���[����ŗD��v�f�����o��a�Ɋi�[����B */
/* �߂�l�F����(0) �L���[�ɉ����i�[����Ă��Ȃ�(-1) */
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

/* �v�fa�Ɨv�fb�̗D��x���r����B */
/* �߂�l�F�v�fa�̂ق����D��x������(1) ����ȊO(0) */
int  pque_itemcmp(PqueItemType *a, PqueItemType *b){
    /* PqueItemType�������^�ł���A�傫���ق����D��x������ */
    return ( a->distance > b->distance ) ? 1 : 0;
}


// �T�C�Yh�̃q�[�va�ɂ����āAi�̃m�[�h�����Ƃ���c���[���ő�q�[�v�ɂ���
void maxHeapify(int h, PqueItemType a[],int i){
    int l,r,largest;
    PqueItemType tmp;

    l = left(i);
    r = right(i);
    // ���̎q�A�����A�E�̎q�Œl���ő�̃m�[�h��I��
    largest = i;
    if( (l <= h) && pque_itemcmp(&a[l], &a[largest]) ){
        largest = l;
    }

    if( (r <= h) && pque_itemcmp(&a[r], &a[largest]) ){
        largest = r;
    }

    if( largest != i ){ // i �̎q�̕����l���傫���ꍇ
        tmp         = a[i];
        a[i]        = a[largest];
        a[largest]  = tmp;
        maxHeapify(h, a, largest); // �ċA�I�ɌĂяo��
    }
}

// �T�C�Yh�̃q�[�va���ő�q�[�v�ɂ���
void buildMaxHeap(int h, PqueItemType a[]){
    int i;
    for( i = h/2; i > 0; i-- ){
        maxHeapify(h, a, i);
    }
}


/* ����̖����� */

int main(){
    int n,b,x,y,m,s,g; //����
    int i,j;
    int pos[BILL_NUM+1][2];
    double dif[BILL_NUM+1][BILL_NUM+1];
    PqueItemType queitem;
    int ans_flag;

    pque_init();

    while(1){

        scanf("%d",&n);
        if(n<=0)break;

        //�ʒu�ǂݍ���
        for(i=0;i<n;i++){
            scanf("%d %d %d",&b,&x,&y);
            pos[i][0]=x;
            pos[i][1]=y;
        }
        //�����v�Z
        for(i=1;i<=n;i++){
            for(j=1;j<=n;j++){
                dif[i][j] = hypot(pos[i][0]-pos[j][0],pos[i][1]-pos[j][1]);
            }
        }

        scanf("%d",&m);
        //�ʒu�ǂݍ���
        for(i=0;i<m;i++){
            scanf("%d %d",&s,&g);

            //�_�C�N�X�g��

            //�����ݒ�i�ŏ��̃r��������0�Ƃ��ăL���[�ɓ����j
            queitem.distance = 0;
            queitem.history[0] = s;
            queitem.history_cnt = 1;
            for(i=1;i<=n;i++)queitem.gone[i]=FALSE;
            queitem.gone[s] = TRUE;
            pque_insert(&queitem);

            ans_flag = FALSE;
            //�������ŏ��̂��̂��珇�Ɏ��o���ď���
            while(pque_extract(&queitem)==0){
                int hist_cnt = queitem.history_cnt;
                int last = queitem.history[hist_cnt-1];
                //�S�[������
                if(last == g)break;
                for(i=1;i<=n;i++){
                    if(dif[last][i]>50)continue;
                    if(queitem.gone[i]==TRUE)continue;
                    //���ɍs����r�����L���[�ɓ����
                    queitem.gone[i] = TRUE;
                    queitem.distance += dif[last][i];
                    queitem.history[hist_cnt] = i;
                    queitem.history_cnt++;
                    pque_insert(&queitem);
                    //�f�[�^���ė��p����̂ł��Ƃɖ߂�
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

