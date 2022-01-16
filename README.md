#fvwm-crystal
https://github.com/fvwm-crystal/fvwm-crystal
--------------------------------------------

FVWM-Crystal aims to create an easy to use, powerful desktop environment for
Linux or other Unix-like operating systems with lots of eye-candy.

It uses following programs:
- FVWM as a window manager and "main core",
- fvwm-crystal, ROX-Filer or Nautilus as desktop manager (manages icons on the desktop),
  the fvwm-crystal desktop manager support network mount using http or
  https (tested with webdav and davfs2),
- gnome-terminal, xterm, aterm, mrxvt or urxvt as terminal emulators,
- AlsaPlayer, mplayer, MPD, QuodLibet, XMMS2 and others as music players
  (there's built-in support for controlling these programs),
and several other tools for different functions, like setting a wallpaper
or making screenshots.


Key features
------------

- Transparent elements of the interface: panels, menus, dialogs
  (pseudo-transparency, doesn't show windows underneath).
  The windows can be made transparent if xcompmgr and transset-df are installed
  (real transparency).

- Window decorations, panel/menu color-sets and desktop wallpaper changeable
  from the main menu; choice saved for next X sessions.

- Flexible window decorations: can have different title-bar buttons layout,
  pixmaps and button functions.

- Different "recipes" (panel placement and functions, desktop
  functions, window icons/thumbnails), changeable from the menu.

- The Custom recipe with its magical button bar provide a modern look and feel
  with a customizable interface.

- Advanced keyboard support: key-bindings for controlling the desktop
  switching, window management (moving, resizing, focusing, basic operations
  like minimization or closing) - in total there are nearly 90 different
  key-bindings.

- Support for controlling music players by using the keyboard or panel buttons
  and menus; currently AlsaPlayer, audacious. cdcd, cmus, mocp, mpd, mplayer (you
  can also play movies with it), mplayer2 (mplayer fork), Quodlibet and XMMS2
  are supported.

- Advanced support of the terminal windows: special "Quake Console" terminal
  accessible by an Alt+` (grave) keystroke similar to the console found in FPP
  games; terminals can be opened using RMB on the desktop; terminal windows
  don't release focus for newly opened windows (by default).

- A Python script for generating different panels and menus with installed
  applications - automatically finds programs in $PATH and creates specified
  menus and panels.

- Support for nearly 400 different applications - icons, menu/panel database
  entries and window styles. Similar support for the other applications can be
  generated from the preferences menu or added manualy into the database.

- Applications menu customization by the user or system administrator will
  not be lost with fvwm-crystal software updates.

- Localization support using gettext.


Advanced features
-----------------

- All FVWM configuration is divided into small files in a simple directory
  structure.

- Special functions for loading configuration files – allows for FVWM
  configuration files placed in different directories (for example system-wide
  and user-wide); user files are searched before system-wide files (directory
  structure must be preserved), the first found file is loaded.

- Simple and easy to use system of "user preferences" which adds to the
  configuration files' ability to remember different user choices and recall
  them at any moment, usually at the startup of X session.

- Support for system-wide configuration in /etc/X11/fvwm/fvwm-crystal directory
  as well as user configuration in ~/.fvwm-crystal directory - changes in
  configuration files can be preserved between package updates.

- Special files called "recipes" - similar to "standard" FVWM configuration
  model (one configuration - one file), allows for different configurations in
  the same package (for example different music players changeable during
  runtime).

- Support for different icon themes and sizes (similar to /usr/share/icons
  directory), included are many icons in 22x22, 32x32 and 48x48 sizes.

- Special script that will generate the application database and window styles
  by looking at the applications provided desktop files and icons.


Developement features
---------------------

- Built-in fvwm FvwvConsole support for direct fvwm input.

- Built-in fvwm-crystal developement in ~/.fvwm-crystal/ directory.
  Here, all files copied here from the ${prefix}/share/fvwm-crystal/fvwm
  directory can be edited.


Requirements
------------

- fvwm - version 2.6.9 or higher. This include fvwm3.
- Python 3 - for applications menu database and random wallpaper.
- ImageMagick - import and convert are used for screenshots.
- UAM and pmount-gui - automounting of removable medias, optional.
- ROX-Filer or Nautilus - for icons on the desktop and wallpaper, optional.
- XScreenSaver - a screen saver and/or screen locking, optional.
- Systray: at least one of Trayer or Stalonetray.
- xdg-user-dirs - localized desktop icons.
- Sudo and optionally gksudo configured for running text/graphical
  applications as superuser and reboot/shutdown computer options in the menu.
  Hibernation is supported via pm-utils or systemd.
- Terminal Emulator: at least one of gnome-terminal, konsole, xfce4-terminal,
  xterm, aterm, Eterm, mrxvt, urxvt or terminator.
  Be aware that the Quake console need one of mrxvt, urxwt, aterm or xterm.
- A program for setting a wallpaper such as Esetroot (orphaned here), hsetroot
  or feh (only needed if ROX-Filer or Nautilus are not used as suggested above).
  Habak support was removed due to X Errors at restart. hsetroot will be used first
  if present.
- A music player - At least one of Music Player Daemon (+ mpc), X MultiMedia
  System (+ xmms-shell and XMMSFind) (orphaned now on most distribution, you
  will be better with another one), AlsaPlayer, cmus, mocp, mplayer, XMMS2,
  Quod Libet or cdcd. You will get video support with mplayer. Optional.
- A mixer, one of the precedent if the player support it, aumix or
  amixer (alsamixer, you will get volume control in dB with it), optional.
- Some usual linux utilities like cut, sed and bc. (bc is needed for the speed
  control with AlsaPlayer and mplayer.)
- wget is needed by the IPTV playlists support for mplayer. The nsfw
  category is not enabled by default and only the root user can enable it
  in $FVWM_CONFIGDIR.

Instalation / Update
--------------------

Please be sure to read the information into the Install file when installing
or updating Fvwm-Crystal. It is a few things you will have to do in order
to get the full potential of Fvwm + Fvwm-Crystal.

Start Fvwm-Crystal
------------------

Fvwm-Crystal work fine with graphical display managers like xdm or gdm.
Choose it in the menu and it will start.
(The desktop file is installed in /usr(/local)/share/xsessions/fvwm-crystal.desktop
and fvwm-crystal should be available in any graphical display manager.)

Anyway, the prefered way to start Fvwm is with startx. You will get a fast
and light system without to have to load non needed stuffs at login.

If you choose that way, you may want to edit ~/.xinitrc and add
	exec /usr/bin/fvwm-crystal
if your system is polkit and console-kit free.

If it is not the case, something like the following will do the trick:
	exec ck-launch-session /usr/bin/fvwm-crystal

If you want to log Fvwm messages, you can use somethink like
	exec /usr/bin/fvwm-crystal 2>.fvwm-crystal_messages
or
	exec ck-launch-session /usr/bin/fvwm-crystal 2>.fvwm-crystal_messages

Now, run 'startx'.

For Fvwm-Crystal to start at login, edit ~/.bash_profile and add the
following line at the end of the file:
	if ! pidof X &>/dev/null ; then startx ; fi

Contacting authors and other users/contributors
-----------------------------------------------

The original author of FVWM-Crystal project is Maciej Delmanowski.
You can contact with him using:

Jabber (preferred):	harnir@jabberek.net
Email:			harnir@berlios.de
IRC:			#fvwm-crystal@irc.freenode.net (also on #fvwm)

The current maintainer and author of this project is Dominique Michel.
You can contact me using <dominique_libre@users.sourceforge.net> or on the
mailing list below.

There is also a low-traffic mailing list, where you can talk with other
FVWM-Crystal users and contributors. More information and subscription
instructions can be found on: 
    http://lists.berlios.de/mailman/listinfo/fvwm-crystal-users
You can also look at the archives located here:
    http://lists.berlios.de/pipermail/fvwm-crystal-users/

Know Issues
-----------

-): With the Music -> Playlist browser, file or directory names with quoting characters
will confuse FVWM. I see that as a bug in FVWM - we all have utf-8 file system where
such characters are valid ones into a file or a directory name, but anyway, these
function make an intensive use of the shell, and for that reason the only real fix
at that time, and I think for all eternity, is to fix your file and directory
names by removing such characters. (Do a goggle search on special characters in file
names and the shell to get more info on that.)

In the preferences of the Music menu, it is an option to get no icon into that
file browser: This can help with the special characters in some cases, but this
is a workaround not a real fix, and it will be of no help with quoting
characters, and will break the exec title function (the function that
load all the files of a directory into the playlist when clicking
on that directory's name) instead.
The real fix is to remove the quoting characters from your file and directory names.

-): Certainly others. Please report them to the mailing list - best, your report(s)
will be archived, which insure they will not be lost, or to me directly - see next
section:


Contribute to Fvwm-Crystal
--------------------------

The best way to contribute is to take contact on the mailing list.
You can also take contact with me using <dominique_libre@users.sourceforge.net>

I would never have learn Fvwm myself without Fvwm-Crystal. Its modular
architecture allow you to focus on one thing at a time.

For information on Fvwm, take a look at the Fvwm website: http://www.fvwm.org


Thanks
------

I would like to thank all these people for help with this project (in random
order): Aragorn_Vime, Lucass, Taviso, Hoppke, Ravbc, Myles Green, Esack,
theBlackDragon, Thomas_Adam, Liorithiel, MadCow, LiNiO, fEnIo, KHorne, QsoRiX,
niv, stR4y and all others which I can't recollect now - thanks, guys :)

I would like to thank harnir. Without him and his good work and vision,
Fvwm-Crystal would not exist.

I would also like to thank all the peoples behind Fvwm. Without them,
Fvwm-Crystal would not be possible.


Donations
---------
FVWM-Crystal is and always will be a free software, however if you want, you
can make a donation - I probably will spent it on my electricity & telephone
bills... Anyway, below is the neccesary info to do that.

Account:	PL 90 1140 2004 0000 3102 3664 7363
Name:		Maciej Delmanowski
Bank:		mBank
Address:	90-050 Lodz, Al. Mickiewicza 1, Poland
