#include <stdio.h>
#include <stdlib.h>

#define MAX   (1<<15)

/* �����̔z��prime�i�v�f��n�j�ɑ΂�             */
/* �C���f�b�N�X0�`n-1���f�����ǂ������i�[����B */
/* �f���ł����1�A�����łȂ����0               */
void make_prime( char prime[], int n ){
    int i,j;        /* ���[�v�p�ꎞ�ϐ� */

    /* ������ */
    for( i=0; i<n; i++ ){
        prime[i] = 1;
    }

    /* �f�����X�g�����F�G���g�X�e�l�X�̂ӂ邢 */
    prime[0]=prime[1]=0;
    for( i=0; i<n; i++ ){
        if( prime[i] ){
            for( j=i*2; j<n; j+=i ){
                prime[j] = 0;
            }
        }
    }
}

int calc( const char prime[], int n ){
    int i;
    int cnt;

    /* i(2�`n/2)�ɂ��� */
    cnt = 0;
    for( i=2; i<=n/2; i++){
        if( prime[i] && prime[n-i] ){
            cnt++;
        }
    }
    return cnt;
}

int main(){
    int n;
    char prime[ MAX+1 ];

    /* �C���f�b�N�X�̒l���f�����ǂ������������X�g���쐬 */
    make_prime( prime, MAX+1 );

    while( 1 ){
        /* scanf�Ɏ��s�����ꍇ�����[�v�𔲂���悤��0�ŏ����� */
        n = 0;
        scanf( "%d", &n );
        if( n<=0 ) break;

        printf( "%d\n", calc( prime, n) );
    }

    return 0;
}
