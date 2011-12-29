export prefix = /usr/local
export exec_prefix = $(prefix)
export bindir = $(exec_prefix)/bin

package	= jupiter
version	= 1.0
tarname	= $(package)
distdir = $(tarname)-$(version)

all clean check install uninstall jupiter:
	$(MAKE) -C src $@

dist: distclean $(distdir).tar.gz

$(distdir).tar.gz: $(distdir)
	tar chof - $(distdir) | gzip -9 -c >$(distdir).tar.gz
	rm -rf $(distdir)

$(distdir):
	mkdir -p $(distdir)/src
	cp Makefile $(distdir)
	cp src/Makefile $(distdir)/src
	cp src/main.c $(distdir)/src

distclean:
	-rm -rf $(distdir).tar.gz
	-rm -rf $(distdir)

distcheck: $(distdir).tar.gz
	gzip -cd $+ | tar xvf -
	$(MAKE) -C $(distdir) all check
	$(MAKE) -C $(distdir) DESTDIR=$${PWD}/$(distdir)/_inst \
	  install uninstall
	$(MAKE) -C $(distdir) clean
	rm -rf $(distdir)
	@echo -n "*** Package $(distdir).tar.gz "
	@echo "ready for distribution."

.PHONY: FORCE all clean check dist distcheck distclean
.PHONY: install uninstall
