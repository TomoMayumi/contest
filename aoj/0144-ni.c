#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

#define VD void
#define U4 unsigned int
#define U1 unsigned char
#define S4 int

/* ---------- �萔��` ------------ */
#define MAX_COUNT_ROUTER	(100)		/* ���[�^�̍ő吔 */

#define NOT_CONNECTED		(0)			/* ���[�^�ڑ��Ȃ� */
#define IS_CONNECTED		(1)			/* ���[�^�ڑ����� */
#define END_SEARCH			(-1)		/* �T���Ώ۔z��̔ԕ� */

#define IS_COMPLETE			(1)			/* �T������ */
#define	NOT_COMPLETE		(0)			/* �T�������� */



S4 main()
{
    int i,j;
	/* ---------- �ϐ���` ---------- */
	U4 u4_t_numRouter;		/* �����[�^�ԍ� */
	U1 u1_t_delimiter;		/* ��؂蕶�� */
	S4 s4_t_TTL;			/* TTL */
	S4 s4_t_srcRouter;		/* ���M�����[�^�ԍ� */
	S4 s4_t_dstRouter;		/* ���惋�[�^�ԍ� */

	S4 s4_tp_connectedRouter[MAX_COUNT_ROUTER + 1][MAX_COUNT_ROUTER + 1] = { 0 };		/* ���[�^�ڑ����B�O�Ԗڂ̗v�f�͎g��Ȃ� */
	S4 s4_tp_searchRouter[MAX_COUNT_ROUTER + 1];										/* �T���Ώۃ��[�^�ԍ� */
	S4 s4_tp_nextSearchRouter[MAX_COUNT_ROUTER];										/* ����T���Ώۃ��[�^�ԍ� */

	U1 u1_t_isComplete;		/* �T�������t���O */

	/* ---------- �ꎞ�ϐ� ---------- */
	U4 u4_t_routerNumber;	/* ���[�^�ԍ� */
	U4 u4_t_cntPacket;		/* �p�P�b�g�� */
	S4 s4_t_searchRouter;	/* �T���Ώۃ��[�^�ԍ� */
	S4 s4_t_nextSearchRouterIndex;	/* ����T���Ώۃ��[�^�ԍ��i�[�p�C���f�b�N�X */

	/* ---------- �J�E���^ ---------- */
	U4 u4_t_ri;			/* ���[�^�ڑ����i�[���[�v */
	U4 u4_t_pi;			/* �p�P�b�g���i�[���[�v */
	S4 s4_t_hop;		/* �z�b�v��(���[�^�̌o�R��) */
	S4 s4_t_si;			/* �T���p���[�v */
	U4 u4_t_ni;			/* ����T���Ώۃ��[�^�ԍ��i�[�p���[�v */
	U4 u4_t_ci;			/* �T���Ώۃ��[�^�ԍ��R�s�[�p���[�v */

	/* �����[�^������� */
	scanf("%d%c", &u4_t_numRouter, &u1_t_delimiter);

	/* ---------- ���[�^�̐ڑ�������� ---------- */
	for (u4_t_ri = (U4)1; u4_t_ri <= u4_t_numRouter; u4_t_ri++) {
		u1_t_delimiter = ' ';
		/* ���s�����[�^�̐ڑ����̋�؂蕶�� */
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

	/* ---------- �T�� ---------- */
	scanf("%d%c", &u4_t_cntPacket, &u1_t_delimiter);

	/* �p�P�b�g�̐������T�������s */
	for (u4_t_pi = (U4)0; u4_t_pi < u4_t_cntPacket; u4_t_pi++) {
		/* ���M�����[�^�ԍ��A���惋�[�^�ԍ��ATTL����� */
		scanf("%d %d %d%c", &s4_t_srcRouter, &s4_t_dstRouter, &s4_t_TTL, &u1_t_delimiter);

		/* 1��ڂ̒T���́A���[�^�����ڌq�����Ă��邩�̊m�F�̂� */
		s4_tp_searchRouter[0] = s4_t_srcRouter;
		s4_tp_searchRouter[1] = (S4)END_SEARCH;

		u1_t_isComplete = (U1)NOT_COMPLETE;

		s4_t_hop = (S4)2;

		/* �z�b�v����TTL�𒴂��邩�A�T������������܂ŒT�� */
		while ((s4_t_hop <= s4_t_TTL) &&
			   (u1_t_isComplete != (U1)IS_COMPLETE)) {

			s4_t_si = (S4)0;
			/* �T���Ώۃ��[�^���Ȃ��Ȃ邩�A�T������������܂ŒT�� */
			while ((s4_tp_searchRouter[s4_t_si] != (S4)END_SEARCH) &&
				  (u1_t_isComplete != (U1)IS_COMPLETE)) {

				/* �T���Ώۃ��[�^�ƈ��惋�[�^�����ڌq�����Ă��邪�m�F */
				s4_t_searchRouter = s4_tp_searchRouter[s4_t_si];
				if (s4_tp_connectedRouter[s4_t_searchRouter][s4_t_dstRouter] == (S4)IS_CONNECTED) {
					u1_t_isComplete = (U1)IS_COMPLETE;
				}

				/* ���݂̒T���Ώۃ��[�^���璼�ڌq�����Ă��郋�[�^ = ���̒T���Ώۃ��[�^ */
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
				/* �T���Ώۃ��[�^����q�����Ă��郋�[�^��S�Ē��׏I�����̂ŁA�z�b�v���𑝂₷ */
				s4_t_hop++;
			}

			/* ����T���Ώۃ��[�^��T���Ώۃ��[�^�ɃR�s�[ */
			s4_t_nextSearchRouterIndex = (S4)0;
			for (u4_t_ci = (U4)0; u4_t_ci < u4_t_numRouter; u4_t_ci++) {
				if (s4_tp_nextSearchRouter[u4_t_ci] == (S4)IS_CONNECTED) {
					s4_tp_searchRouter[s4_t_nextSearchRouterIndex] = u4_t_ci;
					s4_t_nextSearchRouterIndex++;
					/* ������ */
					s4_tp_nextSearchRouter[u4_t_ci] = (S4)NOT_CONNECTED;
				}
			}
			s4_tp_searchRouter[s4_t_nextSearchRouterIndex] = (S4)END_SEARCH;
		}

		/* TODO�F���ʂ�z��ɒ��߂āA��x�ɏo�͂���悤�ɏ������Ȃ��ƁAAIZU ONLINE�̓p�X���Ȃ� */
		/* TTL�ȓ��ɓ��B�ł����ꍇ */
		if (u1_t_isComplete == (U1)IS_COMPLETE) {
			printf("%d\n", s4_t_hop);
		}
		else {
			printf("NA\n");
		}
	}

	return((U4)0);

}

