#include <jupcommon.h>

#if HAVE_CONFIG_H
#include <config.h>
#endif

#include <stdio.h>
#include <stdlib.h>

#if HAVE_PTHREAD_H
#include <pthread.h>
#endif


static void *
print_it(void *data)
{
	printf("Hello from %s!\n", (char *)data);
	return 0;
}

int
print_routine(char *name)
{
#if ASYNC_EXEC
	pthread_t tid;
	pthread_create(&tid, 0, print_it, name);
	pthread_join(tid, 0);
#else
	print_it(name);
#endif
	return 0;
}
