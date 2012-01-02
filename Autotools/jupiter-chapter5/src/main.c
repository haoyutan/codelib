#include <libjupiter.h>

#define DEFAULT_SALUTATION "Hello"

int
main(int argc, char *argv[])
{
	char *salutation = DEFAULT_SALUTATION;
	if (argc > 1)
		salutation = argv[1];
	jupiter_print(salutation, argv[0]);
	return 0;
}
