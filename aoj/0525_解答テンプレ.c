#include <stdio.h>

#define R_MAX 10    // �ő�s�T�C�Y
#define C_MAX 10000 // �ő��T�C�Y

int main( void );
int solve(int r, int c, int a[R_MAX][C_MAX]);

int main( void ){
    static int a[R_MAX][C_MAX];
    int r,c;
    int ri,ci;
    int ans;

    while(1){
        //����
        scanf("%d %d",&r,&c);
        if( (r<=0) || (c<=0) ) break;

        for(ri=0;ri<r;ri++){
            for(ci=0;ci<c;ci++){
                scanf("%d",&(a[ri][ci]));
            }
        }
        //����
        ans = solve(r,c,a);
        //�o��
        printf("%d\n",ans);
    }

    return 0;
}


// �����F
//      r   : �s��
//      c   : ��
//      a[�s][��] : ���݂̗��\(0:��,1:�\)���i�[���ꂽ2�d�z��
// �߂�l�F
//      �𓚂ƂȂ�o�ׂł�����݂̍ő吔

int solve(int r, int c, int a[R_MAX][C_MAX]){
    return 0;
}


/****** �����܂Ńe���v���[�g *******/
