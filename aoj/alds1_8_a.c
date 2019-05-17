#include <stdio.h>
#include <string.h>

#define STR_MAX 100
#define MAX_NODE 500001

// ノード型定義
typedef struct _NODE{
    int key;
    struct _NODE *right;
    struct _NODE *left;
} NODE;

// ノード用RAM管理
NODE node_pool[MAX_NODE];
int node_cnt;
NODE *make_node(int key);

// ツリー操作
NODE *insert_tree(NODE *root,int k);
void print_tree(NODE *root);
void print_tree_inorder(NODE *node);
void print_tree_preorder(NODE *node);

/////////////////////////////
// メイン処理
int main(){
    int i;
    int m,k;
    NODE *root;
    char buf[STR_MAX];

    node_cnt = 0;
    root = NULL;

    // 命令数を読み込んでループ
    scanf("%d%*c",&m);
    for( i=0; i<m; i++){
        // 命令を読み込んで処理
        fgets(buf,STR_MAX,stdin);
        if(strncmp(buf,"insert",6)==0){
            // insert
            sscanf(buf,"%*s %d",&k);
            root = insert_tree(root,k);
        }else if(strncmp(buf,"print",5)==0){
            // print
            print_tree(root);
        }else{
            //処理なし
        }
    }

    return 0;
}


/////////////////////////////
// ツリー操作

// 要素追加
// ツリーのルートを返す
NODE *insert_tree(NODE *root,int k){
    NODE *new_root = root;
    NODE *y = NULL; // x の親
    NODE *x = root;
    NODE *z = make_node(k);

    while( x != NULL ){
        y = x; // 親を設定
        if( z->key < x->key ){
            x = x->left; // 左の子へ移動
        }else{
            x = x->right; // 右の子へ移動
        }
    }

    if( y == NULL){ // T が空の場合
        new_root = z;
    }else if( z->key < y->key){
        y->left = z; // z を y の左の子にする
    }else{
        y->right = z; // z を y の右の子にする
    }

    return new_root;
}

// 内容表示
void print_tree(NODE *root){
    print_tree_inorder(root);
    printf("\n");
    print_tree_preorder(root);
    printf("\n");
}
// 中間順巡回
void print_tree_inorder(NODE *node){
    if(node==NULL) return;
    print_tree_inorder(node->left);
    printf(" %d",node->key);
    print_tree_inorder(node->right);
}

// 先行順巡回
void print_tree_preorder(NODE *node){
    if(node==NULL) return;
    printf(" %d",node->key);
    print_tree_preorder(node->left);
    print_tree_preorder(node->right);
}

//////////////////////
//ノード用RAM管理

//新規ノード作成
NODE *make_node(int key){
    NODE *node = &node_pool[node_cnt];
    node_cnt++;
    node->key   = key;
    node->right = NULL;
    node->left  = NULL;
    return node;
}

