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
void release_node(NODE *node);

// ツリー操作
NODE *insert_node(NODE *root,int k);
void print_tree(NODE *root);
void print_tree_inorder(NODE *node);
void print_tree_preorder(NODE *node);
NODE *find_node(NODE *root,int k);
void delete_node(NODE **root,int k);

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
            root = insert_node(root,k);
        }else if(strncmp(buf,"print",5)==0){
            // print
            print_tree(root);
        }else if(strncmp(buf,"find",4)==0){
            // find
            sscanf(buf,"%*s %d",&k);
            if(find_node(root,k)==NULL){
                printf("no\n");
            }else{
                printf("yes\n");
            }
        }else if(strncmp(buf,"delete",6)==0){
            // delete
            sscanf(buf,"%*s %d",&k);
            delete_node(&root,k);
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
NODE *insert_node(NODE *root,int k){
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

// 指定のキーのノードを返す
// 見つからなければNULLを返す
NODE *find_node(NODE *root,int k){
    NODE *next;
    if(root == NULL) return NULL;
    if(root->key == k) return root;
    if(root->key < k){
        next = root->right;
    }else{
        next = root->left;
    }

    return find_node(next,k);
}

// 指定のキーのノードを削除する
void delete_node(NODE **root,int k){
    NODE **ref;
    ref = root;

    while( (*ref != NULL) && ((*ref)->key != k) ){
        if((*ref)->key < k){
            ref = &((*ref)->right);
        }else{
            ref = &((*ref)->left);
        }
    }

    while(*ref != NULL){
        if( (*ref)->left != NULL ){
            (*ref)->key = (*ref)->left->key;
            ref     = &((*ref)->left);
        }else if( (*ref)->right != NULL ){
            (*ref)->key = (*ref)->right->key;
            ref     = &((*ref)->right);
        }else{
            release_node(*ref);
            *ref = NULL;
        }
    }
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

//既存ノード削除（メモリ解放）
void release_node(NODE *node){
}
