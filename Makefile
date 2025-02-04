#!/usr/bin/make -f
.PHONY: all install uninstall dist correctpath install-doc uninstall-doc 

prefix?=/usr/local
addondir?=$(prefix)/share/fvwm-crystal/addons
mandir?=$(prefix)/share/man

RELEASE=`grep Version fvwm/components/functions/About | cut -d" " -f 4 | sed -e 's:"::'`
docdir?=$(prefix)/share/doc/fvwm-crystal-$(RELEASE)
freebsdetc?=
nano?=/bin/nano

all:
	@echo "There is nothing to compile."
	@echo
	@echo 'To install FVWM-Crystal in "/usr/local", run:'
	@echo '    su -c "make install"'
	@echo 'To install it into "/usr", run:'
	@echo '    su -c "make prefix=/usr install"'
	@echo
	@echo 'The variable EDITOR is set by fvwm-crystal and is needed to work'
	@echo 'for its first statup. Its value is set by default to'
	@echo '    EDITOR="/bin/nano"'
	@echo 'Check where nano is installed with'
	@echo '    whereis nano'
	@echo 'If it is installed into another path, run make install with:'
	@echo '    nano=/path/to/nano'
	@echo 'As example:'
	@echo '    su -c "make nano=/usr/bin/nano install"'
	@echo 'nano is used to show a preferences editor at first startup.'
	@echo
	@echo 'You can recall the preferences editor and change the default user'
	@echo 'editor at any time from Crystal menu -> Preferences -> Preferences editor.'
	@echo
	@echo 'You can also use that variable to set another user editor - tested with'
	@echo 'nano and (X)emacs.'
	@echo
	@echo 'Some system like freebsd separate the base system from the other software.'
	@echo 'On such system, run as root:'
	@echo '    make freebsdetc=/usr/local nano=/usr/local/bin/nano install'
	@echo

install: correctpath install-doc
	@echo Installing fvwm-crystal $(RELEASE) to $(prefix)
	mkdir -p $(DESTDIR)$(prefix)/bin $(DESTDIR)$(prefix)/share/fvwm-crystal/fvwm $(DESTDIR)$(prefix)/share/xsessions $(DESTDIR)$(freebsdetc)/etc/X11/Sessions $(DESTDIR)$(freebsdetc)/etc/sudoers.d

	install -m 755 bin/fvwm-crystal.apps bin/fvwm-crystal.wallpaper bin/fvwm-crystal bin/fvwm-crystal.infoline bin/fvwm-crystal.mplayer-wrapper bin/fvwm-crystal.play-movies bin/fvwm-crystal.play-playlists bin/fvwm-crystal.videomodeswitch- bin/fvwm-crystal.videomodeswitch+ $(DESTDIR)$(prefix)/bin
	install -m 755 bin/fvwm-crystal.generate-menu $(DESTDIR)$(prefix)/bin
	cp -r fvwm/* $(DESTDIR)$(prefix)/share/fvwm-crystal/fvwm/
	cp shared/fvwm-crystal $(DESTDIR)$(freebsdetc)/etc/X11/Sessions
	cp shared/fvwm-crystal.desktop $(DESTDIR)$(prefix)/share/xsessions
	sh ./makesudoers.sh
	cp fvwm-crystal.sudoers.d $(DESTDIR)$(freebsdetc)/etc/sudoers.d/fvwm-crystal
	chmod 440 $(DESTDIR)$(freebsdetc)/etc/sudoers.d/fvwm-crystal

	mkdir -p $(DESTDIR)$(mandir)/man1
	cp -r man/* $(DESTDIR)$(mandir)/man1
# restore the original files; needed for successive run
	cp -f tmp/bak/fvwm-crystal bin/fvwm-crystal
	cp -f tmp/bak/fvwm-crystal.generate-menu bin/fvwm-crystal.generate-menu
	cp -f tmp/bak/shared/fvwm-crystal shared/fvwm-crystal
	cp -f tmp/bak/LastChoosenRecipe fvwm/preferences/LastChoosenRecipe
	cp -f tmp/bak/EDITOR fvwm/preferences/EDITOR
	cp -f tmp/bak/Xephyr fvwm/components/functions/Xephyr
	cp -f tmp/bak/Fvwm-Crystal-Menu fvwm/components/functions/Fvwm-Crystal-Menu
# cleanup
	rm -rf tmp
	rm -f fvwm-crystal.sudoers.d

uninstall: uninstall-doc
	@echo "Uninstalling previously installed fvwm-crystal"
	rm -rf $(DESTDIR)$(prefix)/share/fvwm-crystal
	rm -f $(DESTDIR)$(prefix)/bin/fvwm-crystal.wallpaper $(DESTDIR)$(prefix)/bin/fvwm-crystal.apps $(DESTDIR)$(prefix)/bin/fvwm-crystal $(DESTDIR)$(prefix)/bin/fvwm-crystal.generate-menu $(DESTDIR)$(prefix)/bin/fvwm-crystal.infoline $(DESTDIR)$(prefix)/bin/fvwm-crystal.mplayer-wrapper $(DESTDIR)$(prefix)/bin/fvwm-crystal.play-movies $(DESTDIR)$(prefix)/bin/fvwm-crystal.videomodeswitch+ $(DESTDIR)$(prefix)/bin/fvwm-crystal.videomodeswitch-
	rm -f $(DESTDIR)$(prefix)/share/man/man1/fvwm-crystal.1 $(DESTDIR)$(prefix)/share/man/man1/ApplicationDatabase.1 $(DESTDIR)$(prefix)/share/man/man1/CrystalRoxHOWTO.1 $(DESTDIR)$(prefix)/share/man/man1/FVWMCrystalFAQ.1 $(DESTDIR)$(prefix)/share/man/man1/KeyboardBindings.1 $(DESTDIR)$(prefix)/share/man/man1/MouseBindings.1 $(DESTDIR)$(prefix)/share/man/man1/Tips.1
	rm -f $(DESTDIR)$(prefix)/share/xsessions/fvwm-crystal.desktop $(DESTDIR)$(freebsdetc)/etc/X11/Sessions/fvwm-crystal
	rm -f $(DESTDIR)$(freebsdetc)/etc/sudoers.d/fvwm-crystal

# This is meant for creating a distribution tarball from the repository and
# not for the use by end users
dist:
	mkdir -p "../fvwm-crystal-$(RELEASE)"
#	find -maxdepth 1 ! -name "." ! -name ".*" ! -name "*.html" ! -name "fvwm-crystal-$(RELEASE)" \
#		-exec cp -R -P {} "fvwm-crystal-$(RELEASE)/" \;
	rsync -a . "../fvwm-crystal-$(RELEASE)" --exclude '.*'
	rm -f "../fvwm-crystal-$(RELEASE)/update_ChangeLog"
	tar czf "../fvwm-crystal-$(RELEASE).tar.gz" "../fvwm-crystal-$(RELEASE)"
	rm -rf "../fvwm-crystal-$(RELEASE)"

dist-minimal:
	# Create all important directories
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm"
	# Copy basic files
	cp -r AUTHORS ChangeLog ChangeLog.old Contribute LICENSE Export.README INSTALL Makefile NEWS README.md	makesudoers.sh fvwm-crystal-minimal-$(RELEASE)/
	cp -r fvwm/config fvwm-crystal-minimal-$(RELEASE)/fvwm/
	# Copy addons/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/addons"
	cp -r addons/* fvwm-crystal-minimal-$(RELEASE)/addons/
	# Copy shared/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/shared"
	cp -r shared/* fvwm-crystal-minimal-$(RELEASE)/shared/
	# Copy man/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/man"
	cp -r man/* fvwm-crystal-minimal-$(RELEASE)/man/
	# Copy bin/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/bin"
	cp -r bin/* fvwm-crystal-minimal-$(RELEASE)/bin/
	# Copy doc/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/doc"
	cp -r doc/* fvwm-crystal-minimal-$(RELEASE)/doc/
	# Copy fvwm/Applications/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/Applications"
	find fvwm/Applications -maxdepth 1 ! -name "." ! -name ".*" ! -name "Applications" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/Applications/" \;
	# Copy fvwm/colorsets/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/colorsets"
	find fvwm/colorsets -maxdepth 1 ! -name "." ! -name ".*" ! -name "colorsets" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/colorsets/" \;
	# Copy fvwm/components/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/components"
	find fvwm/components -maxdepth 1 ! -name "." ! -name ".*" ! -name "components" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/components/" \;
	# Copy fvwm/decorations/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations/Crystal"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations/DarkSky"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations/MicroClear"
	find fvwm/decorations/Crystal -maxdepth 1 ! -name "." ! -name ".*" ! -name "Crystal" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations/Crystal/" \;
	find fvwm/decorations/DarkSky -maxdepth 1 ! -name "." ! -name ".*" ! -name "DarkSky" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations/DarkSky/" \;
	find fvwm/decorations/MicroClear -maxdepth 1 ! -name "." ! -name ".*" ! -name "MicroClear" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/decorations/MicroClear/" \;
	# Copy fvwm/icons/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/categories"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/fvwm-crystal"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/categories"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/fvwm-crystal"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/48x48"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/48x48/categories"
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/48x48/fvwm-crystal"
	# Copy 22x22 application icons
	cp fvwm/icons/Default/22x22/apps/default.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/xterm.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/aterm.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/Eterm.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/urxvt.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/mrxvt.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/konsole.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/gnome-terminal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/multi-gnome-terminal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/xfce4-terminal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/elinks.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/aptsh.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/aptitude.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/lynx.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/links2.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/irssi.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/aumix.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/fetchmail.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/snownews.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/mutt.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/mc.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/gimp.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/mplayer.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/gajim.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/psi.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/konqueror.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/openoffice.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/fvwm-crystal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/debian.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/ubuntu.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	cp fvwm/icons/Default/22x22/apps/grml.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/apps/
	# Copy 32x32 application icons
	cp fvwm/icons/Default/32x32/apps/default.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/xterm.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/aterm.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/Eterm.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/urxvt.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/mrxvt.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/konsole.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/gnome-terminal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/multi-gnome-terminal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/xfce4-terminal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/elinks.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/aptsh.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/aptitude.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/lynx.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/links2.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/irssi.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/aumix.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/fetchmail.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/snownews.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/mutt.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/mc.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/gimp.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/mplayer.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/gajim.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/psi.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/konqueror.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/openoffice.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/fvwm-crystal.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/debian.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/ubuntu.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	cp fvwm/icons/Default/32x32/apps/grml.png fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/apps/
	# Copy other icons
	find fvwm/icons/Default/22x22/categories -maxdepth 1 ! -name "." ! -name ".*" ! -name "categories" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/categories/" \;
	find fvwm/icons/Default/22x22/fvwm-crystal -maxdepth 1 ! -name "." ! -name ".*" ! -name "fvwm-crystal" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/22x22/fvwm-crystal/" \;
	find fvwm/icons/Default/32x32/categories -maxdepth 1 ! -name "." ! -name ".*" ! -name "categories" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/categories/" \;
	find fvwm/icons/Default/32x32/fvwm-crystal -maxdepth 1 ! -name "." ! -name ".*" ! -name "fvwm-crystal" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/32x32/fvwm-crystal/" \;
	find fvwm/icons/Default/48x48/categories -maxdepth 1 ! -name "." ! -name ".*" ! -name "categories" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/48x48/categories/" \;
	find fvwm/icons/Default/48x48/fvwm-crystal -maxdepth 1 ! -name "." ! -name ".*" ! -name "fvwm-crystal" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/icons/Default/48x48/fvwm-crystal/" \;
	# Copy fvwm/locales/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/locale"
	find fvwm/locale -maxdepth 1 ! -name "." ! -name ".*" ! -name "locale" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/locale/" \;
	# Copy fvwm/preferences/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/preferences"
	find fvwm/preferences -maxdepth 1 ! -name "." ! -name ".*" ! -name "preferences" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/preferences/" \;
	# Copy fvwm/config/ # What is that?
	#mkdir -p "fvwm-crystal-minimal-$(RELEASE)/config"
	#find config -maxdepth 1 ! -name "." ! -name ".*" ! -name "config" \
	#	-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/config/" \;
	# Copy fvwm/recipes/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/recipes"
	cp -r fvwm/recipes/Default fvwm/recipes/LapRight fvwm/recipes/Light fvwm/recipes/Nebulae fvwm/recipes/TopLine fvwm-crystal-minimal-$(RELEASE)/fvwm/recipes
	# Copy fvwm/scripts/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/scripts"
	find fvwm/scripts -maxdepth 1 ! -name "." ! -name ".*" ! -name "scripts" \
		-exec cp -R -P {} "fvwm-crystal-minimal-$(RELEASE)/fvwm/scripts/" \;
	# Copy fvwm/wallpapers/
	mkdir -p "fvwm-crystal-minimal-$(RELEASE)/fvwm/wallpapers"
	cp -r fvwm/wallpapers/fvwm-crystal-dark1-1024x768.jpg fvwm-crystal-minimal-$(RELEASE)/fvwm/wallpapers
	# Make modifications
	cat fvwm/components/functions/About | sed 's/\(\*About:\s*Text \"\$$\[gt\.Version\]\:\)\(.*\)\"/\1\2-minimal"/' > fvwm-crystal-minimal-$(RELEASE)/fvwm/components/functions/About
	cat fvwm/recipes/Default | sed -e 's/--panel-icons=topapp/--panel-icons=standard/' | sed -e 's/--panel-action3=topapp/--panel-action3=menu/' > fvwm-crystal-minimal-$(RELEASE)/fvwm/recipes/Default
	cat fvwm/recipes/TopLine | sed -e 's/--panel-icons=topapp/--panel-icons=standard/' | sed -e 's/--panel-action3=topapp/--panel-action3=menu/' > fvwm-crystal-minimal-$(RELEASE)/fvwm/recipes/TopLine
	head -n 50 fvwm/components/styles/Application-Icons-22-32 > fvwm-crystal-minimal-$(RELEASE)/fvwm/components/styles/Application-Icons-22-32
	tar czf "../fvwm-crystal-minimal-$(RELEASE).tar.gz" "fvwm-crystal-minimal-$(RELEASE)"
	rm -rf "fvwm-crystal-minimal-$(RELEASE)"

clean:
	rm -rf tmp
	rm -f fvwm-crystal.sudoers.d

# It is needed to adjust some path inside fvwm-crystal.generate-menu since this file must know the install path
correctpath:
	# On FreeBSD, sed do not understand -i => use redirections.
	mkdir -p tmp/bin
	# Make temporary backups
	mkdir -p tmp/bak/shared
	cp bin/fvwm-crystal tmp/bak
	cp bin/fvwm-crystal.generate-menu tmp/bak
	cp shared/fvwm-crystal tmp/bak/shared
	cp fvwm/preferences/LastChoosenRecipe tmp/bak/LastChoosenRecipe
	cp fvwm/preferences/EDITOR tmp/bak/EDITOR
	cp fvwm/components/functions/Xephyr tmp/bak/Xephyr
	cp fvwm/components/functions/Fvwm-Crystal-Menu tmp/bak/Fvwm-Crystal-Menu
	# Set FVWM_SYSTEMDIR and FVWM_CONFIGDIR
	sed 's:/usr/share:$(prefix)/share:' < bin/fvwm-crystal > tmp/bin/fvwm-crystal.new \
		&&  sed 's:/etc/X11:$(freebsdetc)/etc/X11:' < tmp/bin/fvwm-crystal.new > bin/fvwm-crystal
	# Set FVWM-Crystal icons and applications database directories.
	sed 's:FC_MENUBASEROOT="/usr/share:FC_MENUBASEROOT="$(prefix)/share:' < bin/fvwm-crystal.generate-menu > tmp/fvwm-crystal.generate-menu.new \
		&& sed 's:FC_ICONBASEROOT="/usr/share:FC_ICONBASEROOT="$(prefix)/share:' < tmp/fvwm-crystal.generate-menu.new > bin/fvwm-crystal.generate-menu
	sed 's:SYSPREFS="/usr/share:SYSPREFS="$(prefix)/share:' < bin/fvwm-crystal.generate-menu > tmp/fvwm-crystal.generate-menu.new \
		&& mv -f tmp/fvwm-crystal.generate-menu.new bin/fvwm-crystal.generate-menu
	# Set fvwm-crystal path in session file.
	sed 's:/usr/bin:$(prefix)/bin:' < shared/fvwm-crystal > tmp/fvwm-crystal.new \
		&& mv -f tmp/fvwm-crystal.new shared/fvwm-crystal
	# Set preferences path.
	sed 's:/usr/bin:$(prefix)/bin:' < fvwm/preferences/LastChoosenRecipe > tmp/LastChoosenRecipe.new \
		&& mv -f tmp/LastChoosenRecipe.new fvwm/preferences/LastChoosenRecipe
	# Set editor path, must be set for first statup.
	sed 's:/bin/nano:$(nano):' < fvwm/preferences/EDITOR > tmp/EDITOR.new \
		&& mv -f tmp/EDITOR.new fvwm/preferences/EDITOR
	# Set path to xsessions files.
	sed 's:/usr/share:$(prefix)/share:' < fvwm/components/functions/Xephyr > tmp/Xephyr.new \
		&& mv -f tmp/Xephyr.new fvwm/components/functions/Xephyr
	sed 's:/usr/share/xsessions:$(prefix)/share/xsessions:' < fvwm/components/functions/Fvwm-Crystal-Menu > tmp/Fvwm-Crystal-Menu.new \
		&& mv -f tmp/Fvwm-Crystal-Menu.new fvwm/components/functions/Fvwm-Crystal-Menu

uninstall-doc:
	-rm -rf $(DESTDIR)$(docdir)
	-rm -rf $(DESTDIR)$(addondir)

install-doc:
	mkdir -p $(DESTDIR)$(addondir) $(DESTDIR)$(docdir)/html
	install -m 644 addons/* $(DESTDIR)$(addondir)
	install -m 644 AUTHORS Contribute NEWS ChangeLog ChangeLog.old Export.README README.md INSTALL $(DESTDIR)$(docdir)
	cp -r doc/* $(DESTDIR)$(docdir)
