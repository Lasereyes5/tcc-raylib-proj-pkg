/* 
 * s_fabsf.c copied and shinked from openlibm.
 * Original source code: https://github.com/JuliaMath/openlibm/blob/master/src%2Fs_fabsf.c
 */

/* s_fabsf.c -- float version of s_fabs.c.
 * Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
 */

/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunPro, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice
 * is preserved.
 * ====================================================
 */

/*
 * fabsf(x) returns the absolute value of x.
 */

float fabsf(float x)
{
	/* A union which permits us to convert between a float and a 32 bit int.  */
	union ieee_float_shape_type
	{
		float value;
		/* FIXME: Assumes 32 bit int.  */
		unsigned int word;
	} sf_u;
	
	sf_u.value = x;
	sf_u.word &= 0x7fffffff;
	return sf_u.value;
}
