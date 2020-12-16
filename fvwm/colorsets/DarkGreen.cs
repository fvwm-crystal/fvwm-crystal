# DarkGreen colorset
# Written by: Axquan <axquan@arx.pl>

SetEnv Colorset_Name "DarkGreen"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 50

Colorset $[infostore.cs_panel_inactive] \
Foreground "white", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "darkgray", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#1b64a3" 50, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "gray", \
Tint "#56c847" 20, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "gray", \
Tint "blue" 50, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "gray"

Colorset $[infostore.cs_menu_inactive] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "gray", \
Tint "darkgreen" 50, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "white", Background "#1b64a3", \
Hilight "white", Shadow "gray"

Colorset $[infostore.cs_icon_active] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "white", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint "white" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#444444", \
Tint "darkgreen" 50, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x006400"
SetEnv TrayerAlpha "128"
