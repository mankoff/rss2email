# packagers, set DESTDIR to your "package directory" and PREFIX to the prefix you want to have on the end-user system
# end-users who install directly, without packaging: don't care about DESTDIR, update PREFIX if you want to
PREFIX?=/usr/local
INSTALLDIR?=$(DESTDIR)$(PREFIX)
SHAREDIR?=$(INSTALLDIR)/share/rss2email

install:
	install -d $(INSTALLDIR)/bin
	install -d $(SHAREDIR)/docs
	install -d $(SHAREDIR)/examples
	install -m755 r2e                  $(INSTALLDIR)/bin
	install -m755 rss2email.py         $(INSTALLDIR)/bin
	install -m755 misc/r2e-badfeeds.sh $(INSTALLDIR)/bin
	install -m644 README            $(SHAREDIR)/docs
	install -m644 config.py         $(SHAREDIR)/examples/

uninstall:
	rm -f $(INSTALLDIR)/bin/rss2email.py
	rm -f $(INSTALLDIR)/bin/r2e
	rm -f $(INSTALLDIR)/bin/r2e-badfeeds.sh
	rm -rf $(SHAREDIR)

