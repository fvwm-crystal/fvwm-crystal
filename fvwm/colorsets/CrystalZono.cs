# CrystalZono colorset
# Written by: domi.no (domi.no@terra.es)

SetEnv Colorset_Name "CrystalZono"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 50


Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "gray" 50, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "#555555", Background "#777777", \
Hilight "gray", Shadow "gray", \
Tint "white" 0, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "black", Background "#777777", \
Hilight "black", Shadow "black", \
Tint "white" 0, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#777777"

Colorset $[infostore.cs_menu_inactive] \
Foreground "black", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "white" 0, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "black", Background "gray", \
Hilight "black", Shadow "gray"

Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "#777777", \
Hilight "#777777", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0xFFFFFF"
SetEnv TrayerAlpha "256"
