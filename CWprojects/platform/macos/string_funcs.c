/* copied from MSL */

#include "string_funcs.h"
#include <string.h>
#include <stdlib.h>


extern unsigned char __lower_map[256]; /* in MSL C */
#define tolower(x) __lower_map[x]

/* Compare lexigraphically two strings */

int _stricmp(const char *s1, const char *s2)
{
    char c1, c2;
    while (1)
    {
    	c1 = tolower(*s1++);
    	c2 = tolower(*s2++);
        if (c1 < c2) return -1;
        if (c1 > c2) return 1;
        if (c1 == 0) return 0;
    }
}

/* Compare lexigraphically two strings up to a max length */

int _strnicmp(const char *s1, const char *s2, int n)
{
    int i;
    char c1, c2;
    for (i=0; i<n; i++)
    {
        c1 = tolower(*s1++);
        c2 = tolower(*s2++);
        if (c1 < c2) return -1;
        if (c1 > c2) return 1;
        if (!c1) return 0;
    }
    return 0;
}

/* duplicate a string */

char *_strdup(const char *str)
{
	char * rval = (char *)malloc(strlen(str)+1);
	
	if (rval) {
		strcpy(rval, str);
	}
	
	return rval;
}