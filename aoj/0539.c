#include <stdio.h>
#include <stdlib.h>

/* i�̐�Βl��Ԃ� */
int abs(int i);

/* a,b�̏���������Ԃ� */
int min(int a, int b);

/* qsort�p��r�֐�(int�^�l�~��) */
int cmp_int(const void *a, const void *b);



/* �X�̈ʒu�i�߂����ɕ���ł���O��j*/
static int pos[100001];

/* �X�ԍ��͈̔�l�`r�̒���dst�Ɉ�ԋ߂��X�ԍ���Ԃ� */
static int search_nearest(int l, int r, int dst);

int main(){
    int n,m,d,k;
    int sum,nearest,i;

    while( (scanf("%d",&d)>0) && (d>0) ){

        /* ���� n m */
        scanf("%d",&n);
        scanf("%d",&m);

        /* �X�̈ʒu (�{�X�͈ʒu0�ƈʒud��2�X�܈����ɂ���)*/
        pos[0] = 0;
        for(i=1;i<n;i++){
            scanf("%d",&pos[i]);
        }
        pos[n] = d;

        /*  */
        qsort(&pos[1], n-1, sizeof(int), cmp_int);

        /* ��z���̋����v�Z */
        sum = 0;
        for(i=0;i<m;i++){
            scanf("%d",&k);
            nearest = search_nearest(0,n,k);
            sum += abs(pos[nearest] - k);
        }
        printf("%d\n",sum);
    }

    return 0;
}


static int search_nearest(int l, int r, int dst){
    int c,next_l,next_r;

    /* �ċA�̏I�������F�c��X�܌�₪2�� */
    if(l+1==r){
        
        if(abs(pos[l]-dst)<abs(pos[r]-dst)){
            return l;
        }else{
            return r;
        }
    }else{
        /* �񕪒T�� */
        next_l = l;
        next_r = r;
        c = (l+r)/2;

        if(pos[c]<dst){
            next_l = c;
        }else{
            next_r = c;
        }

        return search_nearest(next_l,next_r,dst);
    }
}

int abs(int i){
    return (i<0)?i:-i;
}

int min(int a,int b){
    return (a<b)?a:b;
}


int cmp_int(const void *a, const void *b)
{
    return *(int*)a - *(int*)b;
}
