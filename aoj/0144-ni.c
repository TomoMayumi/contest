#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

#define VD void
#define U4 unsigned int
#define U1 unsigned char
#define S4 int

/* ---------- 定数定義 ------------ */
#define MAX_COUNT_ROUTER	(100)		/* ルータの最大数 */

#define NOT_CONNECTED		(0)			/* ルータ接続なし */
#define IS_CONNECTED		(1)			/* ルータ接続あり */
#define END_SEARCH			(-1)		/* 探索対象配列の番兵 */

#define IS_COMPLETE			(1)			/* 探索完了 */
#define	NOT_COMPLETE		(0)			/* 探索未完了 */



S4 main()
{
    int i,j;
	/* ---------- 変数定義 ---------- */
	U4 u4_t_numRouter;		/* 総ルータ番号 */
	U1 u1_t_delimiter;		/* 区切り文字 */
	S4 s4_t_TTL;			/* TTL */
	S4 s4_t_srcRouter;		/* 送信元ルータ番号 */
	S4 s4_t_dstRouter;		/* 宛先ルータ番号 */

	S4 s4_tp_connectedRouter[MAX_COUNT_ROUTER + 1][MAX_COUNT_ROUTER + 1] = { 0 };		/* ルータ接続情報。０番目の要素は使わない */
	S4 s4_tp_searchRouter[MAX_COUNT_ROUTER + 1];										/* 探索対象ルータ番号 */
	S4 s4_tp_nextSearchRouter[MAX_COUNT_ROUTER];										/* 次回探索対象ルータ番号 */

	U1 u1_t_isComplete;		/* 探索完了フラグ */

	/* ---------- 一時変数 ---------- */
	U4 u4_t_routerNumber;	/* ルータ番号 */
	U4 u4_t_cntPacket;		/* パケット数 */
	S4 s4_t_searchRouter;	/* 探索対象ルータ番号 */
	S4 s4_t_nextSearchRouterIndex;	/* 次回探索対象ルータ番号格納用インデックス */

	/* ---------- カウンタ ---------- */
	U4 u4_t_ri;			/* ルータ接続情報格納ループ */
	U4 u4_t_pi;			/* パケット情報格納ループ */
	S4 s4_t_hop;		/* ホップ数(ルータの経由数) */
	S4 s4_t_si;			/* 探索用ループ */
	U4 u4_t_ni;			/* 次回探索対象ルータ番号格納用ループ */
	U4 u4_t_ci;			/* 探索対象ルータ番号コピー用ループ */

	/* 総ルータ数を入力 */
	scanf("%d%c", &u4_t_numRouter, &u1_t_delimiter);

	/* ---------- ルータの接続情報を入力 ---------- */
	for (u4_t_ri = (U4)1; u4_t_ri <= u4_t_numRouter; u4_t_ri++) {
		u1_t_delimiter = ' ';
		/* 改行がルータの接続情報の区切り文字 */
		while (u1_t_delimiter != '\n') {
			scanf("%d%c", &u4_t_routerNumber, &u1_t_delimiter);
			s4_tp_connectedRouter[u4_t_ri][u4_t_routerNumber] = (S4)IS_CONNECTED;
		}
	}

    for(i=1;i<=u4_t_numRouter;i++){
    for(j=1;j<=u4_t_numRouter;j++){
        printf("%d ",s4_tp_connectedRouter[i][j]);
    }
    printf("\n");
    }

	/* ---------- 探索 ---------- */
	scanf("%d%c", &u4_t_cntPacket, &u1_t_delimiter);

	/* パケットの数だけ探索を実行 */
	for (u4_t_pi = (U4)0; u4_t_pi < u4_t_cntPacket; u4_t_pi++) {
		/* 送信元ルータ番号、宛先ルータ番号、TTLを入力 */
		scanf("%d %d %d%c", &s4_t_srcRouter, &s4_t_dstRouter, &s4_t_TTL, &u1_t_delimiter);

		/* 1回目の探索は、ルータが直接繋がっているかの確認のみ */
		s4_tp_searchRouter[0] = s4_t_srcRouter;
		s4_tp_searchRouter[1] = (S4)END_SEARCH;

		u1_t_isComplete = (U1)NOT_COMPLETE;

		s4_t_hop = (S4)2;

		/* ホップ数がTTLを超えるか、探索が完了するまで探す */
		while ((s4_t_hop <= s4_t_TTL) &&
			   (u1_t_isComplete != (U1)IS_COMPLETE)) {

			s4_t_si = (S4)0;
			/* 探索対象ルータがなくなるか、探索が完了するまで探す */
			while ((s4_tp_searchRouter[s4_t_si] != (S4)END_SEARCH) &&
				  (u1_t_isComplete != (U1)IS_COMPLETE)) {

				/* 探索対象ルータと宛先ルータが直接繋がっているが確認 */
				s4_t_searchRouter = s4_tp_searchRouter[s4_t_si];
				if (s4_tp_connectedRouter[s4_t_searchRouter][s4_t_dstRouter] == (S4)IS_CONNECTED) {
					u1_t_isComplete = (U1)IS_COMPLETE;
				}

				/* 現在の探索対象ルータから直接繋がっているルータ = 次の探索対象ルータ */
				if (u1_t_isComplete != (U1)IS_COMPLETE) {
					for (u4_t_ni = (U4)0; u4_t_ni <= u4_t_numRouter; u4_t_ni++) {
						if (s4_tp_connectedRouter[s4_t_searchRouter][u4_t_ni] == (S4)IS_CONNECTED) {
							s4_tp_nextSearchRouter[u4_t_ni] = (S4)IS_CONNECTED;
						}
					}
				}
				s4_t_si++;
			}

			if (u1_t_isComplete != (U1)IS_COMPLETE) {
				/* 探索対象ルータから繋がっているルータを全て調べ終えたので、ホップ数を増やす */
				s4_t_hop++;
			}

			/* 次回探索対象ルータを探索対象ルータにコピー */
			s4_t_nextSearchRouterIndex = (S4)0;
			for (u4_t_ci = (U4)0; u4_t_ci < u4_t_numRouter; u4_t_ci++) {
				if (s4_tp_nextSearchRouter[u4_t_ci] == (S4)IS_CONNECTED) {
					s4_tp_searchRouter[s4_t_nextSearchRouterIndex] = u4_t_ci;
					s4_t_nextSearchRouterIndex++;
					/* 初期化 */
					s4_tp_nextSearchRouter[u4_t_ci] = (S4)NOT_CONNECTED;
				}
			}
			s4_tp_searchRouter[s4_t_nextSearchRouterIndex] = (S4)END_SEARCH;
		}

		/* TODO：結果を配列に貯めて、一度に出力するように書換えないと、AIZU ONLINEはパスしない */
		/* TTL以内に到達できた場合 */
		if (u1_t_isComplete == (U1)IS_COMPLETE) {
			printf("%d\n", s4_t_hop);
		}
		else {
			printf("NA\n");
		}
	}

	return((U4)0);

}

