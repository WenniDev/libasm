#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <errno.h>

int main(void) {
	{
		printf("\n\n<==== ft_strlen ====>\n");
		
		const char *str = "coucou_ft_strlen";
		printf("str: %s(%p)	|	length: %d\n", str, str, (int)ft_strlen(str));
	}
	{
		printf("\n\n<==== ft_strcpy ====>\n");

		const char *src = "coucou_ft_strcpy";
		char dest[] = "aaaaaaaaaaaaaaaa";
	
		printf("dest:	%s(%p)	|	src: %s(%p)\n", dest, dest, src, src);
		printf("ret:	%s(%p)\n",	ft_strcpy(dest, src), dest);
		printf("dest:	%s(%p)	|	src: %s(%p)\n", dest, dest, src, src);
	}

	{
		printf("\n\n<==== ft_strcmp ====>\n");
		
		const char *s1 = "coucou_ft_strcmp";
		const char *s2 = "coucou_fd_strcmp";
		printf("%s(%p) - %s(%p) = %d\n", s1, s1, s2, s2, ft_strcmp(s1, s2));
		printf("%s(%p) - %s(%p) = %d\n", s1, s1, s2, s2, strcmp(s1, s2));

		printf("%s(%p) - %s(%p) = %d\n", s1, s1, s1, s1, ft_strcmp(s1, s1));
		printf("%s(%p) - %s(%p) = %d\n", s1, s1, s1, s1, strcmp(s1, s1));

		printf("%s(%p) - %s(%p) = %d\n", s2, s2, s1, s1, ft_strcmp(s2, s1));
		printf("%s(%p) - %s(%p) = %d\n", s2, s2, s1, s1, strcmp(s2, s1));

	}
	
	{
		printf("\n\n<==== ft_write ====>\n");
		
		const char *buf = "coucou_ft_write";
		int len = 0;

		printf("buffer:	%s(%p)\n", buf, buf);
		if (ft_write(1, NULL, strlen(buf)) < 0)
			printf("ft_write: %s	|	errno: %d\n", strerror(errno), errno);
		if (ft_write(-1, buf, strlen(buf)) < 0)
			printf("ft_write: %s	|	errno: %d\n", strerror(errno), errno);

		len = ft_write(1, buf, strlen(buf));
		printf("	|	len: %d\n", len);
	}


	{
		printf("\n\n<==== ft_read ====>\n");
		
		char buf[520];
		int len = 0;

		if (ft_read(0, NULL, sizeof(buf)) < 0)
			printf("ft_read: %s	|	errno: %d\n", strerror(errno), errno);
		if (ft_read(-1, &buf, sizeof(buf)) < 0)
			printf("ft_read: %s	|	errno: %d\n", strerror(errno), errno);

		len = ft_read(0, &buf, sizeof(buf));
		printf("buffer: %s(%p)	|	len: %d\n", buf, buf, len);
	}

	{
		printf("\n\n<==== ft_strdup ====>\n");
		
		char *res;
		char *s = "coucou_ft_strdup";

		res = ft_strdup(s);
		printf("res: %s(%p)	|	src: %s(%p)\n", res, res, s, s);
	}

	return (0);
}