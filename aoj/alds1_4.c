#include <stdio.h>

#define MAX (1<<(2*12-3))

void init();
void insert(char *str);
int find(char *str);
int get_hash(char *str);

const int key[] = {
    0  /* A */
    ,0 /* B */
    ,1 /* C */
    ,0 /* D */
    ,0 /* E */
    ,0 /* F */
    ,2 /* G */
    ,0 /* H */
    ,0 /* I */
    ,0 /* J */
    ,0 /* K */
    ,0 /* L */
    ,0 /* M */
    ,0 /* N */
    ,0 /* O */
    ,0 /* P */
    ,0 /* Q */
    ,0 /* R */
    ,0 /* S */
    ,3 /* T */
};

char dic[MAX];

int main(){
    char cmd[7];
    char str[13];
    int n;
    int i;

    init();

    scanf("%d",&n);

    for(i=0;i<n;i++){
        scanf("%s %s",cmd,str);
        if(cmd[0]=='i'){
            /* cmd is "insert" */
            insert(str);
        }else{
            /* cmd is "find" */
            printf(find(str)?"yes\n":"no\n");
        }
    }

    return 0;
}

void init(){
    int i;
    for(i=0;i<MAX;i++)dic[i]=0;
}

void insert(char *str){
    int hash;
    hash = get_hash(str);
    dic[hash>>3]|=0x01<<(hash&0x07);
}

int find(char *str){
    int hash;
    hash = get_hash(str);
    return dic[hash>>3]&(0x01<<(hash&0x07));
}

int get_hash(char *str){
    int hash;
    int idx;

    hash=1;
    for(idx=0;str[idx];idx++){
        hash<<=2;
        hash+=key[str[idx]-'A'];
    }

    return hash;
}