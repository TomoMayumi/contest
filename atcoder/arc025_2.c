#include <stdio.h>

#define MAX_COL (101) /* �ő�� */
#define MAX_ROW (101) /* �ő�s�� */

/* �f�o�b�O�p2�����z��\�� */
void print2d(int h, int w, int ary[MAX_COL][MAX_COL]);

void accum(int n, int input[MAX_COL], int output[MAX_COL]); /* �ݐϘa */
void accum2d(int h, int w, int input[MAX_COL][MAX_COL], int output[MAX_COL][MAX_COL]); /* 2�����ݐϘa */

int main(){
    int sum_ary[MAX_COL][MAX_COL];  /* ���ォ��̋�`�̈��2�����ݐϘa */
    int h,w,c[MAX_COL][MAX_COL];    /* ���� */
    int hs,ws,he,we;                /* ���[�v�p�ꎞ�ϐ�(h,w���ꂼ��̊J�n�ʒu/�I���ʒu) */
    int max_cell_num;               /* �̈搔�̍ő�l */
    int cell_num;                   /* �̈搔 */
    int sum;                        /* �Z�x�̍��v */

    /* ���� */
    scanf("%d %d",&h,&w);
    for(hs=1;hs<=h;hs++){
        for(ws=1;ws<=w;ws++){
            scanf("%d",&(c[hs][ws]));
            /* ���̓}�C�i�X�l�ŕێ����� */
            if((hs+ws)%2==0){
                c[hs][ws]=-c[hs][ws];
            }
        }
    }

    /* ��̌v�Z���y�ɂ��邽�߁A���͗̈�̍���Ə�s��0��ԕ��Ƃ��ē���Ă��� */
    for(hs=0;hs<=h;hs++){
        c[hs][0] = 0;
    }
    for(ws=0;ws<=w;ws++){
        c[0][ws] = 0;
    }

    /* �ݐϘa�v�Z */
    accum2d(h+1,w+1,c,sum_ary);

    /* �ő�̗̈��T�� */
    /* ��`�̈�̃p�^�[��(���オ(hs,ws),�E����(he,we)�ƂȂ��`)��S�T�� */
    /* �����}�C�i�X�A�����v���X�̒l�Ƃ��Ă��邽�߁A�̈�̍��v��0�ɂȂ�Ώ����𖞂��� */
    max_cell_num = 0;
    
    for(hs=1;hs<=h;hs++){
        for(ws=1;ws<=w;ws++){
            for(he=hs;he<=h;he++){
                for(we=ws;we<=w;we++){
                    /* �̈�̔Z�x���v�v�Z */
                    sum = sum_ary[he][we] - sum_ary[hs-1][we] - sum_ary[he][ws-1] + sum_ary[hs-1][ws-1];
                    if(sum == 0){
                        /* �̈�̃T�C�Y�v�Z */
                        cell_num = (he-hs+1)*(we-ws+1);
                        if(max_cell_num < cell_num){
                            max_cell_num = cell_num;
                        }
                    }
                }
            }
        }
    }

    /* �o�� */
    printf("%d\n",max_cell_num);
}


/* �ݐϘa */
/* ���� n �̔z�� input �ɑ΂��A�擪����̗ݐϘa��output�ɓ���� */
void accum(int n, int input[MAX_COL], int output[MAX_COL]){
    int i;
    output[0] = input[0];
    for(i=1;i<n;i++){
        output[i] = output[i-1] + input[i];
    }
}

/* 2�����ݐϘa */
/* ���� h�A�� w ��2�����z�� input�ɑ΂��A���ォ��̗ݐϘa��2�����z��output�ɓ���� */
void accum2d(int h, int w, int input[MAX_COL][MAX_COL], int output[MAX_COL][MAX_COL]){
    int hi,wi;
    accum(w,input[0],output[0]);
    for(hi=1;hi<h;hi++){
        accum(w,input[hi],output[hi]);
        for(wi=0;wi<w;wi++){
            output[hi][wi] += output[hi-1][wi];
        }
    }
}

/* �f�o�b�O�p2�����z��\�� */
void print2d(int h, int w, int ary[MAX_COL][MAX_COL]){
    int hi,wi;
    for(hi=0;hi<h;hi++){
        for(wi=0;wi<w;wi++){
            printf("%d ",ary[hi][wi]);
        }
        printf("\n");
    }
}

