# Midnight colorset
# Written by: Rafal Bisingier <ravbc@man.poznan.pl>

SetEnv Colorset_Name "Clear"

# What colorsets do we use?
Read $./colorset-definition

DefaultColors rgb:88/88/88 rgb:11/11/11

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground rgb:00/00/00, Background rgb:00/00/00, \
Hilight rgb:00/00/00, Shadow rgb:00/00/00, \
IconAlpha 70

Colorset $[infostore.cs_panel_inactive] \
Foreground rgb:cc/cc/cc, Background rgb:1c/1c/1c, \
Hilight rgb:55/55/55, Shadow rgb:55/55/55, \
RootTransparent, Tint rgb:1c/1c/1c 20, \
IconAlpha 60, IconTint rgb:00/00/00 5

Colorset $[infostore.cs_panel_active] \
Foreground rgb:ff/ff/ff, Background rgb:13/08/70, \
Hilight rgb:16/0c/6a, Shadow rgb:16/0c/6a, \
RootTransparent, Tint rgb:13/08/70 70

Colorset $[infostore.cs_panel_wininactive] \
Foreground rgb:99/99/99, Background rgb:00/00/00, \
Hilight rgb:33/33/33, Shadow rgb:33/33/33, \
RootTransparent, Tint rgb:99/99/99 50

Colorset $[infostore.cs_panel_winactive] \
Foreground rgb:ff/ff/ff, Background rgb:00/33/66, \
Hilight rgb:44/66/aa, Shadow rgb:44/66/aa, \
RootTransparent, Tint rgb:00/00/ff 30

Colorset $[infostore.cs_panel_border] \
Background rgb:44/44/44

Colorset $[infostore.cs_menu_inactive] \
Foreground rgb:ff/ff/ff, Background rgb:10/10/10, \
Hilight rgb:33/56/56, Shadow rgb:33/56/56, Plain, NoShape

Colorset $[infostore.cs_menu_active] \
Foreground rgb:00/00/00, Background rgb:77/88/99, \
Hilight rgb:55/55/55, Shadow rgb:55/55/55, Plain, NoShape

Colorset $[infostore.cs_icon_active] \
Foreground rgb:ff/ff/ff, Background rgb:10/10/10, \
Hilight rgb:10/10/10, Shadow rgb:16/0c/6a, \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "#1c1c1c", \
Hilight "#555555", Shadow "#555555", \
Tint "#1c1c1c" 20, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#1c1c1c", \
Hilight "#555555", Shadow "#555555", \
Tint "#1c1c1c" 20, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#1c1c1c", \
Hilight "#555555", Shadow "#555555", \
Tint "#1c1c1c" 20, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#1c1c1c", \
Hilight "#555555", Shadow "#555555", \
Tint "#1c1c1c" 20, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#1c1c1c", \
Hilight "#555555", Shadow "#555555", \
Tint "#1c1c1c" 20, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#1c1c1c", \
Hilight "#555555", Shadow "#555555", \
Tint "#1c1c1c" 20, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor rgb:99/99/99
SetEnv ExternalFontColor rgb:99/99/99

SetEnv TrayerTint "0x1c1c1c"
SetEnv TrayerAlpha "205"
