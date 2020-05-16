#include <stdio.h>
#include <string.h>
void vdToLower(char* chText);
// 文章Tの中に単語Wがいくつ含まれるかを出力
// 単語レベルで比較なので、1単語ずつ読み取り
int main()
{
	char achInputWord[10], achInputText[1000];
	char achEnd[] = "END_OF_TEXT";
	int iLengthWord, iLengthText;
	int iCnt1, iCnt2;
	int iAns = 0;
	scanf("%s\n", achInputWord);
	scanf("%[^\n]%*1[\n]", achInputText);	// 1行読み込みできない？
	printf("%s %s", achInputWord, achInputText);
	// 先頭から順に比較、Wの長さを考慮してTの探索位置を決定
	while (strcmp(achEnd, achInputText) != 0)
	{
		printf("aaa\n");
		iLengthWord = strlen(achInputWord);
		iLengthText = strlen(achInputText);
		// テキスト小文字化
		vdToLower(achInputText);
		// 文字列比較
		for (iCnt1 = 0; iCnt1 < iLengthText - iLengthWord; iCnt1++)
		{
			for (iCnt2 = 0; iCnt2 < iLengthWord; iCnt2++)
			{
				if (achInputText[iCnt1 + iCnt2] != achInputWord[iCnt2])
				{
					break;
				}
			}
		}
		// 次の行読み込み
		scanf("%[^\n]%*c", achInputText);
	}
	printf("%d\n", iAns);
	return 0;
}
// 入力テキストを小文字化
void vdToLower(char* chText)
{
	int iLenghtT = strlen(chText);
	int iCnt;
	int iDiff = 'a' - 'A';
	for (iCnt = 0; iCnt < iLenghtT; iCnt++)
	{
		if ('A' <= chText[iCnt] && chText[iCnt] <= 'Z')
		{
			chText[iCnt] += iDiff;
		}
	}
}