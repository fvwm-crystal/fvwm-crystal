# Metabox colorset
# Written by: harnir

SetEnv Colorset_Name "Metabox"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#4a5f7e" 100, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "black", Background "#eaeaea", \
Hilight "#444444", Shadow "#444444", \
Tint "#eaeaea" 100, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "#4a5f7e", \
Hilight "#666666", Shadow "#666666", \
Tint "#4a5f7e" 100, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#333333"

Colorset $[infostore.cs_menu_inactive] \
Foreground "black", Background "#eaeaea", \
Hilight "black", Shadow "#777777", \
Tint "#eaeaea" 100, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "white", Background "#4a5f7e", \
Hilight "white", Shadow "black"

Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "#eaeaea", \
Hilight "#eaeaea", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#006600", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "#006600" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#eaeaea", \
Tint "#eaeaea" 100, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "black"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0xeaeaea"
SetEnv TrayerAlpha "0"
