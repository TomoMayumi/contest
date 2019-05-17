#include <stdio.h>
#include <windows.h> // ���Ԍv���p

#define R_MAX 10    // �ő�s�T�C�Y
#define C_MAX 10000 // �ő��T�C�Y

int main( void );
int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]);

int main( void ){
    static int a[R_MAX][C_MAX];
    LARGE_INTEGER freq, before, after;
    double time;
    int r,c;
    int ri,ci;
    int ans;

    //�ϐ��̏�����
    memset(&freq,   0x00, sizeof freq);
    memset(&before, 0x00, sizeof before);
    memset(&after,  0x00, sizeof after);

    // ���Ԍv���p���g���擾
    QueryPerformanceFrequency(&freq);

    while(1){
        //����
        scanf("%d %d",&r,&c);
        if( (r<=0) || (c<=0) ) break;

        for(ri=0;ri<r;ri++){
            for(ci=0;ci<c;ci++){
                scanf("%d",&(a[ri][ci]));
            }
        }
        //�����i�{���Ԍv���j
        QueryPerformanceCounter(&before);
        ans = solve(r,c,a);
        QueryPerformanceCounter(&after);

        //�o��
        printf("%d\n",ans);
        time = ((double)(after.QuadPart - before.QuadPart) * 1000 / freq.QuadPart);
        printf("�������ԁF%f[ms]\n",time);
    }

    return 0;
}


// �����F
//      input_row   : �s��
//      input_col   : ��
//      input_ary[�s][��] : ���݂̗��\(0:��,1:�\)���i�[���ꂽ2�d�z��
// �߂�l�F
//      �𓚂ƂȂ�o�ׂł�����݂̍ő吔
/*
int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    return 0;
}
*/

/****** �����܂Ńe���v���[�g *******/


#define MAX(a,b) ((a)>(b)?(a):(b))

// �[���D��T���őS�p�^�[��������
// �s�ɂ��čċA�ŒT��
int dfs_row(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_r);
// ��ɂ��čċA�ŒT��
int dfs_col(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_c);

// ����Ԃł̏o�ׂł�����݂̐���Ԃ�
int calc_sum(int input_row, int input_col, int ary[R_MAX][C_MAX]);


int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    // 0�s�ڂ��珇�ԂɁA���]�v�ۂ�S�p�^�[�������Ă���
    return dfs_row( input_row, input_col, input_ary, 0 );
}

// �s�ɂ��čċA�ŒT��
// next_r : ���]�v�ۂ������s�ԍ�
int dfs_row(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_r){
    int ci,sum1,sum2;
    if( next_r < input_row){

        ////////////
        // ���]���Ȃ��P�[�X

        sum1 = dfs_row( input_row, input_col, ary, next_r+1 );

        ////////////
        // ���]����P�[�X

        // ���Y�s�𔽓]������
        for( ci = 0; ci < input_col; ci++ ){
            ary[next_r][ci] = 1 - ary[next_r][ci];
        }
        sum2 = dfs_row( input_row, input_col, ary, next_r+1 );
        // ���]�����Ď����I������̂Ō��ɖ߂�
        for( ci = 0; ci < input_col; ci++ ){
            ary[next_r][ci] = 1 - ary[next_r][ci];
        }
        return MAX( sum1, sum2 );
    }else{
        // �S�s�����ߏI��������̔���ֈڍs
        return dfs_col( input_row, input_col, ary, 0 );
    }
}

// ��ɂ��čċA�ŒT��
// next_r : ���]�v�ۂ�������ԍ�
int dfs_col(int input_row, int input_col, int ary[R_MAX][C_MAX], int next_c){
    int ri,sum1,sum2;
    if( next_c < input_col){

        ////////////
        // ���]���Ȃ��P�[�X

        sum1 = dfs_col( input_row, input_col, ary, next_c+1 );

        ////////////
        // ���]����P�[�X

        // ���Y��𔽓]������
        for( ri = 0; ri < input_row; ri++ ){
            ary[ri][next_c] = 1 - ary[ri][next_c];
        }
        sum2 = dfs_col( input_row, input_col, ary, next_c+1 );
        // ���]�����Ď����I������̂Ō��ɖ߂�
        for( ri = 0; ri < input_row; ri++ ){
            ary[ri][next_c] = 1 - ary[ri][next_c];
        }
        return MAX( sum1, sum2 );
    }else{
        // ������ߏI�����炤�܂��Ă������v�Z
        return calc_sum( input_row, input_col, ary );
    }
}

// ����Ԃł̏o�ׂł�����݂̐���Ԃ�
int calc_sum(int input_row, int input_col, int ary[R_MAX][C_MAX]){
    int ri,ci,sum;
    sum = 0;
    for( ri = 0; ri < input_row; ri++ ){
        for( ci = 0; ci < input_col; ci++ ){
            if( ary[ri][ci] == 0 ){
                sum++;
            }
        }
    }
    return sum;
}
