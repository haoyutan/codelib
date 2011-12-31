#if HAVE_CONFIG_H
# include <config.h>
#endif

#include <stdio.h>
#include <stdlib.h>

#if HAVE_PTHREAD_H
# include <pthread.h>
#endif

static void *
print_it(void * data)
{
	printf("Hello from %s!\n", (char *)data);
	return 0;
}
	
int
main(int argc, char *argv[])
{
#if HAVE_LIBPTHREAD
	pthread_t tid;
	pthread_create(&tid, 0, print_it, argv[0]);	
	pthread_join(tid, 0);
#else
	print_it(argv[0]);
#endif
	return 0;
}
