#include <stdio.h>
#include <windows.h> // ���Ԍv���p
#include <intrin.h>  // popcnt�p

#define R_MAX 10    // �ő�s�T�C�Y
#define C_MAX 10000 // �ő��T�C�Y

int main( void );
int solve(int input_row, int input_col, unsigned short input_ary[C_MAX]);
int Bit1Count(unsigned short bits);

int main( void ){
    static unsigned short a[C_MAX];
    LARGE_INTEGER freq, before, after;
    double time;
    int r,c;
    int ri,ci;
    int ans,val;
    unsigned short mask=1;

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

        mask = 1;
		for(ci=0;ci<c;ci++){
			a[ci] = 0;
		}
        for(ri=0;ri<r;ri++){
            for(ci=0;ci<c;ci++){
                scanf("%d",&val);
                if (val == 1) {
					a[ci] |= mask;
				}
            }
            mask <<= 1;
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
//      input_ary[��] : ���݂̗��\(0:��,1:�\)��bit�Ŋi�[�����񖈂̔z��
// �߂�l�F
//      �𓚂ƂȂ�o�ׂł�����݂̍ő吔
/*
int solve(int input_row, int input_col, int input_ary[C_MAX]){
    return 0;
}
*/

/****** �����܂Ńe���v���[�g *******/


#define MAX(a,b) ((a)>(b)?(a):(b))

// �^��`
typedef unsigned char  uint8;
typedef unsigned short uint16;
typedef unsigned long  uint32;
typedef signed   char  sint8;
typedef signed   short sint16;
typedef signed   long  sint32;

// �����F
//      input_row   : �s��
//      input_col   : ��
//      input_ary[��] : ���݂̗��\(0:��,1:�\)��bit�Ŋi�[�����񖈂̔z��
// �߂�l�F
//      �𓚂ƂȂ�o�ׂł�����݂̍ő吔
int solve(int input_row, int input_col, unsigned short input_ary[C_MAX]){
    uint32 u4sellable_max;      // �߂�l�F�o�ׂł���ő�l
    uint32 u4sellable_cnt;      // �����̏o�ׂł��鑍��
    uint16 u2row_pattern;       // �s���]�p�^�[���ԍ�
    uint16 u2row_pattern_num;   // �s���]�p�^�[���̐�
    uint16 u2col;               // �񑖍��p�ꎞ�ϐ�
    uint8  u1row;               // �s�����p�ꎞ�ϐ�
    uint8  u1row_reverse[R_MAX];// �e�s�̔��]�v��(0�F���]���Ȃ��A1�F���]����)
    uint8  u1front_cnt;         // �\�̐�
    uint8  u1back_cnt;          // ���̐�

    // �s���Ƃɔ��]�����邩�ǂ�����S�p�^�[�������B
    // 2^row(==1<<row)�p�^�[������A
    // 2�i���\��x���ڂ�x�s��Ή�����
    //  0�F���]���Ȃ��A1�F���]���� �ƍl����B
    u4sellable_max = 0UL;
    u2row_pattern_num = (uint16)(1U << (uint8)input_row); // input_row�͍ő�10�Ȃ̂�uint16�̃T�C�Y�𒴂��Ȃ�
    for( u2row_pattern = (uint16)0U; u2row_pattern < u2row_pattern_num; u2row_pattern++ ){

        // �񂲂Ƃɏo�ׂł��鐔�����߁A���v����
        u4sellable_cnt = 0UL;
        for( u2col = (uint16)0U; u2col < (uint16)input_col; u2col++ ){
            // �\�̐��𐔂���
            u1front_cnt = (uint8)Bit1Count(input_ary[u2col] ^ u2row_pattern);


            // �\�̐��̕���������Η��Ԃ��΂悢�̂ŁA�\�Ɨ��̑傫���ق��̐����o�ׂł���
            u1back_cnt     = (uint8)input_row - u1front_cnt;
            u4sellable_cnt += MAX( u1front_cnt, u1back_cnt );
        }

        // �ő�l���X�V����
        if( u4sellable_max < u4sellable_cnt ){
            u4sellable_max = u4sellable_cnt;
        }
    }

    return (int)u4sellable_max;
}

// popcnt�֐����g����ꍇ
/*
int Bit1Count(unsigned short bits) {
	return (int)__popcnt16(bits);
}
*/

//popcnt�֐����g���Ȃ��ꍇ
int Bit1Count(unsigned short bits) {
	bits = (bits & 0x5555) + ((bits >> 1) & 0x5555);
	bits = (bits & 0x3333) + ((bits >> 2) & 0x3333);
	bits = (bits & 0x0f0f) + ((bits >> 4) & 0x0f0f);
	bits = (bits & 0x00ff) + ((bits >> 8) & 0x00ff);
	return (int)bits;
}
