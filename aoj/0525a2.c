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

// ����Ԃł̏o�ׂł�����݂̐���Ԃ�
int calc_sum(int input_row, int input_col, int ary[R_MAX][C_MAX]);

int solve(int input_row, int input_col, int input_ary[R_MAX][C_MAX]){
    int sellable_max;         // �߂�l�F�o�ׂł���ő�l
    int sellable_cnt;         // �o�ׂł��鐔
    int row_reverse[R_MAX+1]; // �e�s�̔��]�v��(0�F���]���Ȃ��A1�F���]����)
    int col_reverse[C_MAX+1]; // �e��̔��]�v��(0�F���]���Ȃ��A1�F���]����)
    int ri,ci;                // �s�񑖍��p�ꎞ�ϐ�

    // �s�̔��]�p�^�[��������
    for( ri = 0; ri < (input_row+1); ri++){
        row_reverse[ri] = 0;
    }

    sellable_max = 0;

    // �s���Ƃɔ��]�����邩�ǂ�����S�p�^�[������
    while( row_reverse[input_row] == 0 ){

        // �p�^�[���ɍ��킹�čs�𔽓]������
        for( ri = 0; ri < input_row; ri++ ){
            if( row_reverse[ri] == 1 ){
                for( ci = 0; ci < input_col; ci++ ){
                    input_ary[ri][ci] = 1 - input_ary[ri][ci];
                }
            }
        }

        // ��̔��]�p�^�[��������
        for( ci = 0; ci < (input_col+1); ci++){
            col_reverse[ci] = 0;
        }

        // �񂲂Ƃɔ��]�����邩�ǂ�����S�p�^�[������
        while( col_reverse[input_col] == 0 ){

            // �p�^�[���ɍ��킹�ė�𔽓]������
            for( ci = 0; ci < input_col; ci++ ){
                if( col_reverse[ci] == 1 ){
                    for( ri = 0; ri < input_row; ri++ ){
                        input_ary[ri][ci] = 1 - input_ary[ri][ci];
                    }
                }
            }

            // �o�ׂł��閇�������߂�
            sellable_cnt = calc_sum(input_row, input_col, input_ary);

            // �ő�l���X�V����
            if( sellable_max < sellable_cnt ){
                sellable_max = sellable_cnt;
            }

            // �p�^�[���ɍ��킹�ė�𔽓]���������̂����ɖ߂�
            for( ci = 0; ci < input_col; ci++ ){
                if( col_reverse[ci] == 1 ){
                    for( ri = 0; ri < input_row; ri++ ){
                        input_ary[ri][ci] = 1 - input_ary[ri][ci];
                    }
                }
            }

            // ���̗񔽓]�p�^�[�������߂�
            col_reverse[0]++;
            for( ci = 0; ci < input_col; ci++){
                if( col_reverse[ci] < 2 ){
                    break;
                }else{
                    col_reverse[ci] = 0;
                    col_reverse[ci+1]++;
                }
            }
        }

        // �p�^�[���ɍ��킹�čs�𔽓]���������̂����ɖ߂�
        for( ri = 0; ri < input_row; ri++ ){
            if( row_reverse[ri] == 1 ){
                for( ci = 0; ci < input_col; ci++ ){
                    input_ary[ri][ci] = 1 - input_ary[ri][ci];
                }
            }
        }

        // ���̍s���]�p�^�[�������߂�
        row_reverse[0]++;
        for( ri = 0; ri < input_row; ri++){
            if( row_reverse[ri] < 2 ){
                break;
            }else{
                row_reverse[ri] = 0;
                row_reverse[ri+1]++;
            }
        }
    }

    return sellable_max;
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
