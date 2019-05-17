#include <stdio.h>
#include <stdlib.h>

/* i‚Ìâ‘Î’l‚ð•Ô‚· */
int abs(int i);

/* a,b‚Ì¬‚³‚¢•û‚ð•Ô‚· */
int min(int a, int b);

/* qsort—p”äŠrŠÖ”(intŒ^’l~‡) */
int cmp_int(const void *a, const void *b);



/* “X‚ÌˆÊ’ui‹ß‚¢‡‚É•À‚ñ‚Å‚¢‚é‘O’ñj*/
static int pos[100001];

/* “X”Ô†‚Ì”ÍˆÍl`r‚Ì’†‚Ìdst‚Éˆê”Ô‹ß‚¢“X”Ô†‚ð•Ô‚· */
static int search_nearest(int l, int r, int dst);

int main(){
    int n,m,d,k;
    int sum,nearest,i;

    while( (scanf("%d",&d)>0) && (d>0) ){

        /* “ü—Í n m */
        scanf("%d",&n);
        scanf("%d",&m);

        /* “X‚ÌˆÊ’u (–{“X‚ÍˆÊ’u0‚ÆˆÊ’ud‚Ì2“X•Üˆµ‚¢‚É‚·‚é)*/
        pos[0] = 0;
        for(i=1;i<n;i++){
            scanf("%d",&pos[i]);
        }
        pos[n] = d;

        /*  */
        qsort(&pos[1], n-1, sizeof(int), cmp_int);

        /* ‘î”z–ˆ‚Ì‹——£ŒvŽZ */
        sum = 0;
        for(i=0;i<m;i++){
            scanf("%d",&k);
            nearest = search_nearest(0,n,k);
            sum += abs(pos[nearest] - k);
        }
        printf("%d\n",sum);
    }

    return 0;
}


static int search_nearest(int l, int r, int dst){
    int c,next_l,next_r;

    /* Ä‹A‚ÌI—¹ðŒFŽc‚è“X•ÜŒó•â‚ª2‚Â */
    if(l+1==r){
        
        if(abs(pos[l]-dst)<abs(pos[r]-dst)){
            return l;
        }else{
            return r;
        }
    }else{
        /* “ñ•ª’Tõ */
        next_l = l;
        next_r = r;
        c = (l+r)/2;

        if(pos[c]<dst){
            next_l = c;
        }else{
            next_r = c;
        }

        return search_nearest(next_l,next_r,dst);
    }
}

int abs(int i){
    return (i<0)?i:-i;
}

int min(int a,int b){
    return (a<b)?a:b;
}


int cmp_int(const void *a, const void *b)
{
    return *(int*)a - *(int*)b;
}
