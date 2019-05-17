#include <stdio.h>

#define MAX_HEAP 500000     // �ő�q�[�v�T�C�Y

#define right(i) (i*2)      // �q�[�v�ɂ�����m�[�hi�̉E�̎q�̃C���f�b�N�X
#define left(i)  (i*2+1)    // �q�[�v�ɂ�����m�[�hi�̍��̎q�̃C���f�b�N�X

void maxHeapify(int h, int a[],int i);
void buildMaxHeap(int h, int a[]);

/*
�q�[�v�͔z��Ƃ��Ď��B
�C���f�b�N�X�̍l�������蕶�ɍ��킹�邽�߁A�C���f�b�N�X0�͎g�p���Ȃ��B
����āA�T�C�Yh�̃q�[�va��a[1]�`a[h]���g�p����B
*/


// �T�C�Yh�̃q�[�va�ɂ����āAi�̃m�[�h�����Ƃ���c���[���ő�q�[�v�ɂ���
void maxHeapify(int h, int a[],int i){
    int l,r,largest,tmp;
    l = left(i);
    r = right(i);
    // ���̎q�A�����A�E�̎q�Œl���ő�̃m�[�h��I��
    largest = i;
    if( (l <= h) && (a[l] > a[largest]) ){
        largest = l;
    }

    if( (r <= h) && (a[r] > a[largest]) ){
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

    // ����
    scanf("%d",&h);
    for( i = 1; i <= h; i++ ){
        scanf("%d",&(a[i]));
    }

    // �ő�q�[�v��
    buildMaxHeap(h, a);

    // �o��
    for( i = 1; i <= h; i++ ){
        printf(" %d",a[i]);
    }
    printf("\n");

    return 0;
}

