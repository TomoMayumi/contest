#include <stdio.h>

#define MAX_INPUT_LINE  (100U)

#define MAP_SIZE        (MAX_INPUT_LINE/2+1)

#define MAX(a,b)        ((a)>(b)?(a):(b))

int main(){
    int map[MAP_SIZE][MAP_SIZE];
    int i,j,tmp,row,col;

    for(i=0;i<MAP_SIZE;i++)for(j=0;j<MAP_SIZE;j++)map[i][j]=0;

    /* “ü—Í‚ÌŠi”[ */
    row = 0;
    col = 0;
    while( scanf("%d",&(map[row][col])) > 0U ){
        printf("%d %d\n",row,col);
        if( getchar() == '\n' ){
            row=col+1;
            col=0;
        }else{
            row--;
            col++;
        }
    }

    for(i=0;i<MAP_SIZE;i++){
        for(j=0;j<MAP_SIZE;j++){
            if((i==0)&&(j==0)){
                ;
            }else if(i==0){
                map[i][j] += map[i][j-1];
            }else if(j==0){
                map[i][j] += map[i-1][j];
            }else{
                map[i][j] += MAX(map[i][j-1],map[i-1][j]);
            }
        }
    }

    printf("%d\n",map[MAP_SIZE-1][MAP_SIZE-1]);

    return 0;
}