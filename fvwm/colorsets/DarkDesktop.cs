# DarkDesktop colorset
# Written by: fRiQ

SetEnv Colorset_Name "DarkDesktop"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "white", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "darkgray", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#000066" 50, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "gray", Background "#777777", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 50, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "#777777", \
Hilight "#666666", Shadow "#666666", \
Tint "blue" 50, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#777777"

Colorset $[infostore.cs_menu_inactive] \
Foreground "white", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "black" 50, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "black", Background "gray", \
Hilight "black", Shadow "gray"

Colorset $[infostore.cs_icon_active] \
Foreground "white", Background "#777777", \
Hilight "#777777", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "white", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint "white" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000cc", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint "#0000cc" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#444444", \
Tint "black" 50, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x000000"
SetEnv TrayerAlpha "128"
