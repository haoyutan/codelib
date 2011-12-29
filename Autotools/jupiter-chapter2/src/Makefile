CC	= gcc
CFLAGS	= -g -O2

all: jupiter

jupiter: main.c
	$(CC) $(CFLAGS) -o $@ $+

clean:
	rm -rf jupiter

check: all
	./jupiter | grep "Hello from .*jupiter!"
	@echo "*** ALL TESTS PASSED ***"

install:
	install -d $(DESTDIR)$(bindir)
	install -m 0755 jupiter $(DESTDIR)$(bindir)

uninstall:
	-rm $(DESTDIR)$(bindir)/bin/jupiter

.PHONY: all clean check install uninstall
