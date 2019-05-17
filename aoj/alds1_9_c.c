#include <stdio.h>
#include <string.h>

/***********/
// �}�N����`
/***********/
#define PQUE_SIZE 2000000    // �D��x�t���L���[�o�b�t�@�T�C�Y

#define parent(i) (i/2)      // �q�[�v�ɂ�����m�[�hi�̐e�̃C���f�b�N�X
#define right(i)  (i*2)      // �q�[�v�ɂ�����m�[�hi�̉E�̎q�̃C���f�b�N�X
#define left(i)   (i*2+1)    // �q�[�v�ɂ�����m�[�hi�̍��̎q�̃C���f�b�N�X

/***********/
// �^��`
/***********/
typedef int PqueItemType;   // �D��x�t���L���[�i�[�^

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
    return ( *a > *b ) ? 1 : 0;
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
#define MAX_STR 10

int main(){
    char buf[MAX_STR];
    int k;

    pque_init();

    while(1){
        scanf("%s",buf);
        if(strcmp(buf,"insert")==0){
            /* insert */
            scanf("%d",&k);
            pque_insert(&k);
        }else if(strcmp(buf,"extract")==0){
            /* extract */
            pque_extract(&k);
            printf("%d\n",k);
        }else{
            /* end */
            break;
        }
    }

    return 0;
}

