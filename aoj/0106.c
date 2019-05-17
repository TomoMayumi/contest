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


int main(){
    int input;
    int dp[SOBA_MAX];/* dp[g]: g*100[�O����]�̂��΂𔃂��ň��l */
    int i;
    int g;
    int pat;
    int nextg;
    int nextval;
    

    for(i=0;i<SOBA_MAX;i++){
        dp[i] = MAX_VAL;
    }

    dp[0] = 0; /* 0g�w������ɂ�0�~���ň��l */

    for(g=0;g<SOBA_MAX;g++){
        /* g*100[�O����] �w���̍ň��l����A�e�w���P�ʂ�ǉ��w���������ʂ��A����܂ł̍ň��l����������΍ň��l���X�V*/
        for(pat=0;pat<PATTERN_MAX;pat++){
            nextg = g + pattern[pat][0];
            nextval = dp[g] + pattern[pat][1];
            if( (nextg < SOBA_MAX) && (nextval < dp[nextg]) ){
                dp[nextg] = nextval;
            }
        }
    }

    while((scanf("%d",&input)>0) && (input>0)){
        printf("%d\n",dp[input/100]);
    }

    return 0;
}
