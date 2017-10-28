VERSION=1.0
DEBNAME=coyote_$(VERSION)-1

$(DEBNAME).deb:
	rm -rf $(DEBNAME)
	mkdir $(DEBNAME)

	mkdir -p $(DEBNAME)/usr/bin
	cp coyote $(DEBNAME)/usr/bin

	mkdir -p $(DEBNAME)/lib/systemd/system
	cp coyote@.service coyote@.timer $(DEBNAME)/lib/systemd/system/

	cp -r DEBIAN $(DEBNAME)/
	chmod -R a+rX $(DEBNAME)
	fakeroot dpkg-deb --build $(DEBNAME)

clean:
	rm -rf $(DEBNAME) $(DEBNAME).deb

.PHONY: $(DEBNAME).deb clean
