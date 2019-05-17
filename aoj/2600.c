#include <stdio.h>

#define MAX_SIZE 100002

#define OK  0
#define NG  1

#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))


int Col[MAX_SIZE];
int Row[MAX_SIZE];

int main(){
    int n,w,h;
    int xi,yi,wi;
    int i,ans;

    /* ������ */
    for(i=0;i<MAX_SIZE;i++){
        Col[i]=0;
        Row[i]=0;
    }

    /* ���������� */
    scanf("%d %d %d",&n,&w,&h);
    for(i=0;i<n;i++){
        scanf("%d %d %d",&xi,&yi,&wi);
        Col[MAX(xi-wi,0)]++;
        Col[MIN(xi+wi,w)]--;
        Row[MAX(yi-wi,0)]++;
        Row[MIN(yi+wi,h)]--;
    }

    /* �������W�J �� ���� */
    /* �c�����̂ǂ��炩���S�͈͂�ԗ��ł��Ă���΂悢 */
    ans = OK;

    /* ���`�F�b�N */
    for(i=0;i<w;i++){
        if(Col[i]<=0){
            ans = NG;
            break;
        }
        Col[i+1]+=Col[i];
    }

    /* ��NG�Ȃ�Ώc�`�F�b�N */
    if(ans != OK){
        ans = OK;
        for(i=0;i<h;i++){
            if(Row[i]<=0){
                ans = NG;
                break;
            }
            Row[i+1]+=Row[i];
        }
    }

    printf((ans==OK)?"Yes\n":"No\n");

#ifdef DEBUG
    for(i=0;i<w+1;i++)printf("%d ",Col[i]);
    printf("\n");
    for(i=0;i<h+1;i++)printf("%d ",Row[i]);
    printf("\n");
#endif

    return 0;

}