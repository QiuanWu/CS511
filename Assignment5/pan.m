#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: /* STATE 1 - DKR-LEA-Assertion.pml:75 - [I = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.I);
		now.I = 1;
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - DKR-LEA-Assertion.pml:77 - [((I<=5))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.I)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 3 - DKR-LEA-Assertion.pml:79 - [(((Ini[0]==0)&&(5>=1)))] (20:0:2 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((((int)((P0 *)this)->_4_Ini[0])==0)&&(5>=1))))
			continue;
		/* merge: Ini[0] = I(20, 4, 20) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_4_Ini[0]);
		((P0 *)this)->_4_Ini[0] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[0]", ((int)((P0 *)this)->_4_Ini[0]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[0][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 6: /* STATE 5 - DKR-LEA-Assertion.pml:80 - [(((Ini[1]==0)&&(5>=2)))] (20:0:2 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!(((((int)((P0 *)this)->_4_Ini[1])==0)&&(5>=2))))
			continue;
		/* merge: Ini[1] = I(20, 6, 20) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_4_Ini[1]);
		((P0 *)this)->_4_Ini[1] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[1]", ((int)((P0 *)this)->_4_Ini[1]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[0][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 7: /* STATE 7 - DKR-LEA-Assertion.pml:81 - [(((Ini[2]==0)&&(5>=3)))] (20:0:2 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!(((((int)((P0 *)this)->_4_Ini[2])==0)&&(5>=3))))
			continue;
		/* merge: Ini[2] = I(20, 8, 20) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_4_Ini[2]);
		((P0 *)this)->_4_Ini[2] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[2]", ((int)((P0 *)this)->_4_Ini[2]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[0][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 8: /* STATE 9 - DKR-LEA-Assertion.pml:82 - [(((Ini[3]==0)&&(5>=4)))] (20:0:2 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		if (!(((((int)((P0 *)this)->_4_Ini[3])==0)&&(5>=4))))
			continue;
		/* merge: Ini[3] = I(20, 10, 20) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_4_Ini[3]);
		((P0 *)this)->_4_Ini[3] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[3]", ((int)((P0 *)this)->_4_Ini[3]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[0][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 9: /* STATE 11 - DKR-LEA-Assertion.pml:83 - [(((Ini[4]==0)&&(5>=5)))] (20:0:2 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		if (!(((((int)((P0 *)this)->_4_Ini[4])==0)&&(5>=5))))
			continue;
		/* merge: Ini[4] = I(20, 12, 20) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_4_Ini[4]);
		((P0 *)this)->_4_Ini[4] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[4]", ((int)((P0 *)this)->_4_Ini[4]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[0][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 10: /* STATE 13 - DKR-LEA-Assertion.pml:84 - [(((Ini[5]==0)&&(5>=6)))] (20:0:2 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!(((((int)((P0 *)this)->_4_Ini[5])==0)&&(5>=6))))
			continue;
		/* merge: Ini[5] = I(20, 14, 20) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_4_Ini[5]);
		((P0 *)this)->_4_Ini[5] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[5]", ((int)((P0 *)this)->_4_Ini[5]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[0][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 11: /* STATE 17 - DKR-LEA-Assertion.pml:86 - [I = (I+1)] (0:20:1 - 7) */
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: /* STATE 18 - DKR-LEA-Assertion.pml:87 - [((I>5))] (29:0:1 - 1) */
		IfNotBlocked
		reached[0][18] = 1;
		if (!((((int)now.I)>5)))
			continue;
		/* merge: goto :b1(29, 19, 29) */
		reached[0][19] = 1;
		;
		/* merge: proc = 1(29, 23, 29) */
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_4_proc);
		((P0 *)this)->_4_proc = 1;
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P0 *)this)->_4_proc));
#endif
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[0][30] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: /* STATE 23 - DKR-LEA-Assertion.pml:91 - [proc = 1] (0:29:1 - 3) */
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_4_proc);
		((P0 *)this)->_4_proc = 1;
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P0 *)this)->_4_proc));
#endif
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[0][30] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 14: /* STATE 24 - DKR-LEA-Assertion.pml:93 - [((proc<=5))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		if (!((((int)((P0 *)this)->_4_proc)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 25 - DKR-LEA-Assertion.pml:94 - [(run nnode(q[(proc-1)],q[(proc%5)],Ini[(proc-1)]))] (29:0:1 - 1) */
		IfNotBlocked
		reached[0][25] = 1;
		if (!(