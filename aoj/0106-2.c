#include <stdio.h>

#define SOBA_MAX    51  /* ���΍w���ʂ̍ő�(�C���f�b�N�X��50(�ő�w����)�܂łƂ邽�ߗv�f����51) */
#define PATTERN_MAX 6   /* ���i�p�^�[�����i�R�X���ʏ�Ƃ܂Ƃߔ����̂Q�p�^�[�����U�p�^�[���j */

#define MAX_VAL 10000000 /* ����Ɏ�肤��l�̍ő�l���傫���l�iDP�̏����l�Ɏg�p�j */

/* �w���P�ʂƒP���̑g�ݍ��킹 */
const int pattern[PATTERN_MAX][2] = {
    {   200  /100,  380             }
    ,{  200*5/100,  380*5*80/100    }
    ,{  300  /100,  550             }
    ,{  300*4/100,  550*4*85/100    }
    ,{  500  /100,  850             }
    ,{  500*3/100,  850*3*88/100    }
};

int memo[SOBA_MAX];

int dfs(int soba){
    int pat;
    int min;
    int val;

    if(memo[soba]<MAX_VAL) return memo[soba];

    min = MAX_VAL;

    /* �e�w���P�ʂ��w�����Ă݂Ďc��ʂ̍ň��l���v�Z���A���̍��v�̍ŏ��l���ň��l */
    for(pat=0;pat<PATTERN_MAX;pat++){
        if( soba-pattern[pat][0] >= 0 ){
            val = pattern[pat][1] + dfs(soba-pattern[pat][0]);
            if( min > val ){
                min = val;
            }
        }
    }

    return memo[soba]=min;
}

int main(){
    int input;
    int i;

    for(i=0;i<SOBA_MAX;i++){
        memo[i] = MAX_VAL;
    }

    memo[0] = 0; /* 0g�w������ɂ�0�~���ň��l */

    while((scanf("%d",&input)>0) && (input>0)){
        printf("%d\n",dfs(input/100));
    }

    return 0;
}
