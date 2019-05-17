#include <stdio.h>

#define MAX_HEIGHT 30
#define MAX_WIDTH  10

typedef unsigned char U1;
typedef signed   char S1;
typedef signed   int  S4;


/* �ԍ��̑g�ݍ��킹���ɁA����ւ��\�Ȃ�Γ���ւ��\�ʒu�A�����łȂ����0,0������ */
/* [0]�F�i [1]�F�� */
U1 irekae[MAX_WIDTH+1][MAX_WIDTH+1][2];

int main(){
    S4 n,m,atari,d;        /* ���́F�e�l */
    S1 amida[MAX_WIDTH+2]; /* ���́F���݂������̉������ ���[�ɔԕ�0���Œ�œ���邽�ߕ���+2 */
    S4 keika[MAX_WIDTH+1]; /* ���݂������H�蒆�̔ԍ��̈ʒu �C���f�b�N�X0���g��Ȃ����ߕ���+1 */
    S4 i,j,tmp;            /* �v�Z���ꎞ�ϐ� */
    U1 tate,yoko;          /* �o�͎��ꎞ�ϐ� */

    while( (scanf("%d",&n)>0) && (n>0) ){
        /* ���� */
        scanf("%d",&m);
        scanf("%d",&atari);
        scanf("%d",&d);

        /* ����ւ��\�ʒu���̏����� */
        /* i,j�F�c���̔ԍ� */
        for( i=1; i<=n; i++ ){
            for( j=1; j<=n; j++ ){
                irekae[i][j][0] = 0U;
                irekae[i][j][1] = 0U;
            }
        }

        /* ���݂����������ʒu�ݒ� */
        for( i=1; i<=n; i++ ){
            keika[i]=i;
        }

        /* ���[��ԕ�0�Ƃ��� */
        amida[0]='0';
        /* �e�i�̏���ǂݍ��݂Ȃ���A���݂������ǂ�A����ւ��\�Ȕԍ��̑g�ݍ��킹�E�ʒu���L�� */
        /* i�F�i�� , j�F�c���̔ԍ� */
        for( i=1; i<=d; i++){
            /* �ǂݍ��݌�A�E�[��ԕ�0�ɂ��� */
            scanf("%s",&amida[1]);
            amida[n]='0';
            for( j=1; j<=n-1; j++ ){
                /* ����������Γ���ւ��� */
                if( amida[j]=='1' ){
                    tmp        = keika[j];
                    keika[j]   = keika[j+1];
                    keika[j+1] = tmp;
                }else{
                    /* ������ǉ��\�ȏꍇ�A����ւ��\�Ȕԍ��ƈʒu�����L�� */
                    if( (amida[j-1]=='0') && (amida[j+1]=='0') ){
                        /* �o�����ɋ߂���񂪗D��Ȃ̂ŁA���łɋL���ς݂Ȃ�Ή������Ȃ� */
                        if(irekae[keika[j]][keika[j+1]][0]==0){
                            irekae[keika[j]][keika[j+1]][0]=i;
                            irekae[keika[j]][keika[j+1]][1]=j;

                            irekae[keika[j+1]][keika[j]][0]=i;
                            irekae[keika[j+1]][keika[j]][1]=j;
                        }
                    }
                }
            }
        }

        /* �o�� */
        tate = irekae[m][keika[atari]][0];
        yoko = irekae[m][keika[atari]][1];

        if(m==keika[atari]){
            /* �������Ȃ��Ă������� */
            printf("0\n");
        }else{
            if(tate==0){
                /* �L������ĂȂ���΂��ǂ蒅���Ȃ� */
                printf("1\n");
            }else{
                printf("%d %d\n",tate,yoko);
            }
        }
    }

    return 0;
}
