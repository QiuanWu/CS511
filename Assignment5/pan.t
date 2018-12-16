#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(2*sizeof(Trans **));

	/* proctype 0: :init: */

	trans[0] = (Trans **) emalloc(34*sizeof(Trans *));

	T = trans[ 0][32] = settr(79,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(79,2,1,0,0,"ATOMIC", 1, 2, 0);
	trans[0][1]	= settr(48,2,20,3,3,"I = 1", 1, 2, 0);
	trans[0][21]	= settr(68,2,20,1,0,".(goto)", 1, 2, 0);
	T = trans[0][20] = settr(67,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(67,2,2,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(67,2,18,0,0,"DO", 1, 2, 0);
	trans[0][2]	= settr(49,2,15,4,0,"((I<=5))", 1, 2, 0);
	T = trans[0][15] = settr(62,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(62,2,3,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(62,2,5,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(62,2,7,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(62,2,9,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(62,2,11,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(62,2,13,0,0,"IF", 1, 2, 0);
	trans[0][3]	= settr(50,2,20,5,5,"(((Ini[0]==0)&&(5>=1)))", 1, 2, 0); /* m: 4 -> 20,0 */
	reached0[4] = 1;
	trans[0][4]	= settr(0,0,0,0,0,"Ini[0] = I",0,0,0);
	trans[0][16]	= settr(63,2,17,1,0,".(goto)", 1, 2, 0); /* m: 17 -> 0,20 */
	reached0[17] = 1;
	trans[0][5]	= settr(52,2,20,6,6,"(((Ini[1]==0)&&(5>=2)))", 1, 2, 0); /* m: 6 -> 20,0 */
	reached0[6] = 1;
	trans[0][6]	= settr(0,0,0,0,0,"Ini[1] = I",0,0,0);
	trans[0][7]	= settr(54,2,20,7,7,"(((Ini[2]==0)&&(5>=3)))", 1, 2, 0); /* m: 8 -> 20,0 */
	reached0[8] = 1;
	trans[0][8]	= settr(0,0,0,0,0,"Ini[2] = I",0,0,0);
	trans[0][9]	= settr(56,2,20,8,8,"(((Ini[3]==0)&&(5>=4)))", 1, 2, 0); /* m: 10 -> 20,0 */
	reached0[10] = 1;
	trans[0][10]	= settr(0,0,0,0,0,"Ini[3] = I",0,0,0);
	trans[0][11]	= settr(58,2,20,9,9,"(((Ini[4]==0)&&(5>=5)))", 1, 2, 0); /* m: 12 -> 20,0 */
	reached0[12] = 1;
	trans[0][12]	= settr(0,0,0,0,0,"Ini[4] = I",0,0,0);
	trans[0][13]	= settr(60,2,20,10,10,"(((Ini[5]==0)&&(5>=6)))", 1, 2, 0); /* m: 14 -> 20,0 */
	reached0[14] = 1;
	trans[0][14]	= settr(0,0,0,0,0,"Ini[5] = I",0,0,0);
	trans[0][17]	= settr(64,2,20,11,11,"I = (I+1)", 1, 2, 0);
	trans[0][18]	= settr(65,2,29,12,12,"((I>5))", 1, 2, 0); /* m: 23 -> 29,0 */
	reached0[23] = 1;
	trans[0][19]	= settr(66,2,23,1,0,"goto :b1", 1, 2, 0); /* m: 23 -> 0,29 */
	reached0[23] = 1;
	trans[0][22]	= settr(69,2,23,1,0,"break", 1, 2, 0);
	trans[0][23]	= settr(70,2,29,13,13,"proc = 1", 1, 2, 0);
	trans[0][30]	= settr(77,2,29,1,0,".(goto)", 1, 2, 0);
	T = trans[0][29] = settr(76,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(76,2,24,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(76,2,27,0,0,"DO", 1, 2, 0);
	trans[0][24]	= settr(71,2,25,14,0,"((proc<=5))", 1, 2, 0);
	trans[0][25]	= 