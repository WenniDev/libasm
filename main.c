#include "libasm.h"
#include <stdio.h>
#include <string.h>

int main(void) {
	{
		printf("<==== ft_strlen ====>\n");
		
		const char *str = "coucou";
		printf("%s | %d", str, (int)ft_strlen(str));
	}
	{
		printf("\n\n<==== ft_strcpy ====>\n");

		char *src = "coucou";
		char dest[] = "aaaaaa";
	
		printf("dest:	%s(%p)	|	src: %s(%p)\n", dest, dest, src, src);
		printf("ret:	%s(%p)\n",	ft_strcpy(dest, src), dest);
		printf("dest:	%s(%p)	|	src: %s(%p)\n", dest, dest, src, src);
	}
	{
		printf("<==== ft_strcmp ====>\n");
		
		const char *s1 = "0000123";
		const char *s2 = "0000223";
		printf("%s - %s = %d\n", s1, s2, ft_strcmp(s1, s2));
		printf("%s - %s = %d\n", s1, s2, strcmp(s1, s2));
	}
	return (0);
}